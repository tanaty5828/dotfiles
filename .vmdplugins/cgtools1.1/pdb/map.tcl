# Usage: vmd -e map.tcl -f molecule.psf molecule.pdb

if { 1 } {

    package require cg
    package require pbctools

    set mol_name [file rootname [molinfo top get name]]
    if { [file extension ${mol_name}] == ".cg" } {
        puts stderr "Warning: are you trying to map a CG system?"
    }
    if { [file extension ${mol_name}] == ".aa" } {
        set mol_name [file rootname ${mol_name}]
    }

    ## Make CG model
    set sel [atomselect top "all"]
    set newmol [cg -sel $sel map]
    $sel delete

    ## Assign topologies
    set sel [atomselect $newmol "all"]
    cg -sel $sel setbonds
    cg -sel $sel setangles
    cg -molid $newmol reanalyzemol

    $sel writepsf ${mol_name}.cg.psf
    $sel writepdb ${mol_name}.cg.pdb
    $sel delete
}

