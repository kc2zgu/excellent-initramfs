getmod() {
    for mod in "$@"; do

        if [ -d /sys/module/${mod} ]; then
            einfo "Module ${mod} is loaded"
        else
            ebegin "Loading ${mod} module"
            modprobe ${mod}
            eend $?
        fi
    done
}

load_pci_mod() {
    ewarn "load_pci_mod() not implemented"
}

load_mods() {
    mod_group=$1
    case ${mod_group} in
        usb)
            einfo "Loading USB modules"
            getmod uhci_hcd ohci_hcd ehci_hcd xhci_hcd
            getmod usb_storage usbserial hid
            ;;
        pci)
            einfo "Loading modules for PCI devices"
            
            ;;
        stor)
            ewarn "Loading storage modules"
            ;;
    esac
}
