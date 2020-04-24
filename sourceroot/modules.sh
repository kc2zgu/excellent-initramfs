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
            getmod ehci_hcd uhci_hcd ohci_hcd xhci_hcd xhci_pci
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
