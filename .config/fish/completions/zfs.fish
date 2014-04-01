# fish completion for zfs
function __fish_zfs_filesystems
	command sudo zfs list -H -o name
end

function __fish_zfs_properties
	zfs get 2>&1 | egrep -o "^\t[a-zA-Z@.<>]+ +(YES|NO)" | cut -f 2 | cut -f 1 -d ' '
end

function __fish_zfs_properties_editable
	zfs get 2>&1 | egrep -o "^\t[a-zA-Z@.<>]+ +YES" | cut -f 2 | cut -f 1 -d ' '
end

function __fish_zfs_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'zfs' ]
    return 0
  end
  return 1
end

function __fish_zfs_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

### create
complete -f -c zfs -n '__fish_zfs_needs_command' -a create -d 'Creates a new ZFS file system.'
complete -f -c zfs -n '__fish_zfs_using_command create' -s p -d 'Creates all the non-existing parent datasets.'
complete -f -c zfs -n '__fish_zfs_using_command create' -s o -d 'Sets the specified property as if the command zfs set property=value was invoked at the same time the dataset was created.'
complete -f -c zfs -n '__fish_zfs_using_command create' -s s -d 'Creates a sparse volume with no reservation.'
complete -f -c zfs -n '__fish_zfs_using_command create' -s b -d 'Equivalent to -o volblocksize=blocksize.'

### destroy
complete -f -c zfs -n '__fish_zfs_needs_command' -a destroy -d 'Destroys the given dataset.'
#complete -f -c zfs -n '__fish_zfs_using_command destroy' -a '(__fish_zfs_filesystems)'
complete -f -c zfs -n '__fish_zfs_using_command destroy' -s r -d 'Recursively destroy all children.'
complete -f -c zfs -n '__fish_zfs_using_command destroy' -s R -d 'Recursively destroy all dependents, including cloned file systems outside the target hierarchy.'
complete -f -c zfs -n '__fish_zfs_using_command destroy' -s f -d 'Force an unmount of any file systems using the unmount -f command.'
complete -f -c zfs -n '__fish_zfs_using_command destroy' -s n -d 'Do a dry-run ("No-op") deletion.'
complete -f -c zfs -n '__fish_zfs_using_command destroy' -s p -d 'Print machine-parsable verbose information about the deleted data.'
complete -f -c zfs -n '__fish_zfs_using_command destroy' -s v -d 'Print verbose information about the deleted data.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a snapshot -d 'Creates snapshots with the given names.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a rollback -d 'Roll back the given dataset to a previous snapshot.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a clone -d 'Creates a clone of the given snapshot.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a promote -d 'Promotes a clone file system to no longer be dependent on its "origin" snapshot.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a rename -d 'Renames the given dataset.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a list -d 'Lists the property information for the given datasets in tabular form.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a set -d 'Sets the property to the given value for each dataset.'
complete -f -c zfs -n '__fish_zfs_using_command set' -a '(__fish_zfs_properties_editable)='

complete -f -c zfs -n '__fish_zfs_needs_command' -a get -d 'Displays properties for the given datasets.'
complete -f -c zfs -n '__fish_zfs_using_command get' -a '(__fish_zfs_properties)'

complete -f -c zfs -n '__fish_zfs_needs_command' -a inherit -d 'Clears the specified property, causing it to be inherited from an ancestor.'
complete -f -c zfs -n '__fish_zfs_using_command inherit' -s r -d 'Recursively inherit the given property for all children.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a upgrade -d 'Displays a list of file systems that are not the most recent version.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a userspace -d 'Displays space consumed by, and quotas on, each user in the specified filesystem or snapshot.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a groupspace -d 'Displays space consumed by, and quotas on, each group in the specified filesystem or snapshot.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a mount -d 'Displays all ZFS file systems currently mounted.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a unmount -d 'Unmounts currently mounted ZFS file systems.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a share -d 'Shares available ZFS file systems.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a unshare -d 'Unshares currently shared ZFS file systems.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a send -d 'Creates a stream representation of the second snapshot, which is written to standard output.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a receive -d 'Creates a snapshot whose contents are as specified in the stream provided on standard input.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a allow -d 'Displays permissions that have been delegated on the specified filesystem or volume.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a unallow -d 'Removes permissions that were granted with the zfs allow command.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a hold -d 'Adds a single reference, named with the tag argument, to the specified snapshot or snapshots.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a holds -d 'Lists all existing user references for the given snapshot or snapshots.'
complete -f -c zfs -n '__fish_zfs_using_command inherit' -s r -d 'Lists the holds that are set on the named descendent snapshots, in addition to listing the holds on the named snapshot.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a release -d 'Removes a single reference, named with the tag argument, from the specified snapshot or snapshots.'

complete -f -c zfs -n '__fish_zfs_needs_command' -a diff -d 'Display the difference between a snapshot of a given filesystem and another snapshot of that filesystem from a later time or the current contents of the filesystem.'

