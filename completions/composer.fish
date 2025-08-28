# Composer completions for fish shell

# Global options
complete -f -c composer -s h -l help -d 'Display help message'
complete -f -c composer -s q -l quiet -d 'Do not output any message'
complete -f -c composer -s V -l version -d 'Display application version'
complete -f -c composer -l ansi -d 'Force ANSI output'
complete -f -c composer -l no-ansi -d 'Disable ANSI output'
complete -f -c composer -s n -l no-interaction -d 'Do not ask any interactive question'
complete -f -c composer -l profile -d 'Display timing and memory usage information'
complete -f -c composer -l no-plugins -d 'Whether to disable plugins'
complete -f -c composer -s d -l working-dir -r -d 'If specified, use the given directory as working directory'
complete -f -c composer -s v -l verbose -d 'Increase verbosity of messages'

# Main commands
complete -f -c composer -n '__fish_use_subcommand' -a 'about' -d 'Shows information about Composer'
complete -f -c composer -n '__fish_use_subcommand' -a 'archive' -d 'Creates an archive of this composer package'
complete -f -c composer -n '__fish_use_subcommand' -a 'browse' -d 'Opens the package\'s repository URL or homepage in your browser'
complete -f -c composer -n '__fish_use_subcommand' -a 'cc' -d 'Clears composer\'s internal package cache'
complete -f -c composer -n '__fish_use_subcommand' -a 'clear-cache' -d 'Clears composer\'s internal package cache'
complete -f -c composer -n '__fish_use_subcommand' -a 'clearcache' -d 'Clears composer\'s internal package cache'
complete -f -c composer -n '__fish_use_subcommand' -a 'config' -d 'Sets config options'
complete -f -c composer -n '__fish_use_subcommand' -a 'create-project' -d 'Creates new project from a package into given directory'
complete -f -c composer -n '__fish_use_subcommand' -a 'depends' -d 'Shows which packages cause the given package to be installed'
complete -f -c composer -n '__fish_use_subcommand' -a 'diagnose' -d 'Diagnoses the system to identify common errors'
complete -f -c composer -n '__fish_use_subcommand' -a 'dump-autoload' -d 'Dumps the autoloader'
complete -f -c composer -n '__fish_use_subcommand' -a 'dumpautoload' -d 'Dumps the autoloader'
complete -f -c composer -n '__fish_use_subcommand' -a 'exec' -d 'Executes a vendored binary/script'
complete -f -c composer -n '__fish_use_subcommand' -a 'fund' -d 'Discover how to help fund the maintenance of your dependencies'
complete -f -c composer -n '__fish_use_subcommand' -a 'global' -d 'Allows running commands in the global composer dir'
complete -f -c composer -n '__fish_use_subcommand' -a 'help' -d 'Displays help for a command'
complete -f -c composer -n '__fish_use_subcommand' -a 'home' -d 'Opens the package\'s repository URL or homepage in your browser'
complete -f -c composer -n '__fish_use_subcommand' -a 'info' -d 'Shows information about packages'
complete -f -c composer -n '__fish_use_subcommand' -a 'init' -d 'Creates a basic composer.json file in current directory'
complete -f -c composer -n '__fish_use_subcommand' -a 'install' -d 'Installs the project dependencies from the composer.lock file if present, or falls back on the composer.json'
complete -f -c composer -n '__fish_use_subcommand' -a 'licenses' -d 'Shows information about licenses of dependencies'
complete -f -c composer -n '__fish_use_subcommand' -a 'list' -d 'Lists commands'
complete -f -c composer -n '__fish_use_subcommand' -a 'outdated' -d 'Shows a list of installed packages that have updates available'
complete -f -c composer -n '__fish_use_subcommand' -a 'prohibits' -d 'Shows which packages prevent the given package from being installed'
complete -f -c composer -n '__fish_use_subcommand' -a 'reinstall' -d 'Uninstalls and reinstalls the given package names'
complete -f -c composer -n '__fish_use_subcommand' -a 'remove' -d 'Removes a package from the require or require-dev'
complete -f -c composer -n '__fish_use_subcommand' -a 'require' -d 'Adds required packages to your composer.json and installs them'
complete -f -c composer -n '__fish_use_subcommand' -a 'run-script' -d 'Runs the scripts defined in composer.json'
complete -f -c composer -n '__fish_use_subcommand' -a 'search' -d 'Searches for packages'
complete -f -c composer -n '__fish_use_subcommand' -a 'self-update' -d 'Updates composer.phar to the latest version'
complete -f -c composer -n '__fish_use_subcommand' -a 'selfupdate' -d 'Updates composer.phar to the latest version'
complete -f -c composer -n '__fish_use_subcommand' -a 'show' -d 'Shows information about packages'
complete -f -c composer -n '__fish_use_subcommand' -a 'status' -d 'Shows a list of locally modified packages'
complete -f -c composer -n '__fish_use_subcommand' -a 'suggests' -d 'Shows package suggestions'
complete -f -c composer -n '__fish_use_subcommand' -a 'update' -d 'Upgrades your dependencies to the latest version according to composer.json'
complete -f -c composer -n '__fish_use_subcommand' -a 'upgrade' -d 'Upgrades your dependencies to the latest version according to composer.json'
complete -f -c composer -n '__fish_use_subcommand' -a 'validate' -d 'Validates a composer.json and composer.lock'
complete -f -c composer -n '__fish_use_subcommand' -a 'why' -d 'Shows which packages cause the given package to be installed'
complete -f -c composer -n '__fish_use_subcommand' -a 'why-not' -d 'Shows which packages prevent the given package from being installed'

# Install command options
complete -f -c composer -n '__fish_seen_subcommand_from install' -l prefer-source -d 'Forces installation from package sources when possible'
complete -f -c composer -n '__fish_seen_subcommand_from install' -l prefer-dist -d 'Forces installation from package dist even for dev versions'
complete -f -c composer -n '__fish_seen_subcommand_from install' -l dry-run -d 'Outputs the operations but will not execute anything'
complete -f -c composer -n '__fish_seen_subcommand_from install' -l dev -d 'Install packages listed in require-dev'
complete -f -c composer -n '__fish_seen_subcommand_from install' -l no-dev -d 'Disables installation of require-dev packages'
complete -f -c composer -n '__fish_seen_subcommand_from install' -l no-scripts -d 'Skips execution of scripts defined in composer.json'
complete -f -c composer -n '__fish_seen_subcommand_from install' -l no-progress -d 'Do not output download progress'
complete -f -c composer -n '__fish_seen_subcommand_from install' -l no-suggest -d 'Do not show package suggestions'
complete -f -c composer -n '__fish_seen_subcommand_from install' -s o -l optimize-autoloader -d 'Optimize autoloader during autoloader dump'
complete -f -c composer -n '__fish_seen_subcommand_from install' -s a -l classmap-authoritative -d 'Autoload classes from the classmap only'

# Update command options
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l prefer-source -d 'Forces installation from package sources when possible'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l prefer-dist -d 'Forces installation from package dist even for dev versions'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l dry-run -d 'Outputs the operations but will not execute anything'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l dev -d 'Install packages listed in require-dev'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l no-dev -d 'Disables installation of require-dev packages'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l lock -d 'Only updates the lock file hash'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l with-dependencies -d 'Add also dependencies of whitelisted packages to the whitelist'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l prefer-stable -d 'Prefer stable versions of dependencies'
complete -f -c composer -n '__fish_seen_subcommand_from update upgrade' -l prefer-lowest -d 'Prefer lowest versions of dependencies'

# Require command options  
complete -f -c composer -n '__fish_seen_subcommand_from require' -l dev -d 'Add packages to require-dev'
complete -f -c composer -n '__fish_seen_subcommand_from require' -l prefer-source -d 'Forces installation from package sources when possible'
complete -f -c composer -n '__fish_seen_subcommand_from require' -l prefer-dist -d 'Forces installation from package dist even for dev versions'
complete -f -c composer -n '__fish_seen_subcommand_from require' -l no-progress -d 'Do not output download progress'
complete -f -c composer -n '__fish_seen_subcommand_from require' -l no-update -d 'Disables the automatic update of the dependencies'
complete -f -c composer -n '__fish_seen_subcommand_from require' -l update-no-dev -d 'Run the dependency update with the --no-dev option'
complete -f -c composer -n '__fish_seen_subcommand_from require' -l update-with-dependencies -d 'Allows inherited dependencies to be updated'

# Remove command options
complete -f -c composer -n '__fish_seen_subcommand_from remove' -l dev -d 'Remove packages from require-dev'
complete -f -c composer -n '__fish_seen_subcommand_from remove' -l no-progress -d 'Do not output download progress'
complete -f -c composer -n '__fish_seen_subcommand_from remove' -l no-update -d 'Disables the automatic update of the dependencies'
complete -f -c composer -n '__fish_seen_subcommand_from remove' -l update-no-dev -d 'Run the dependency update with the --no-dev option'
complete -f -c composer -n '__fish_seen_subcommand_from remove' -l update-with-dependencies -d 'Allows inherited dependencies to be updated'

# Show/info command options
complete -f -c composer -n '__fish_seen_subcommand_from show info' -l installed -d 'List installed packages only'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -l platform -d 'List platform packages only'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -l available -d 'List available packages only'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -l self -d 'Show the root package information'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -l name-only -d 'List package names only'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -l path -d 'Show package paths'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -s t -l tree -d 'List the dependencies as a tree'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -s l -l latest -d 'Show the latest version'
complete -f -c composer -n '__fish_seen_subcommand_from show info' -s o -l outdated -d 'Show the latest version but only for packages that are outdated'

# Config command options
complete -f -c composer -n '__fish_seen_subcommand_from config' -l global -d 'Apply command to the global config file'
complete -f -c composer -n '__fish_seen_subcommand_from config' -l editor -d 'Open editor'
complete -f -c composer -n '__fish_seen_subcommand_from config' -l auth -d 'Affect auth config file'
complete -f -c composer -n '__fish_seen_subcommand_from config' -l unset -d 'Unset the given setting'
complete -f -c composer -n '__fish_seen_subcommand_from config' -l list -d 'List configuration settings'

# Dump-autoload command options
complete -f -c composer -n '__fish_seen_subcommand_from dump-autoload dumpautoload' -s o -l optimize -d 'Optimizes PSR0 and PSR4 packages to be loaded with classmaps'
complete -f -c composer -n '__fish_seen_subcommand_from dump-autoload dumpautoload' -s a -l classmap-authoritative -d 'Autoload classes from the classmap only'
complete -f -c composer -n '__fish_seen_subcommand_from dump-autoload dumpautoload' -l apcu -d 'Use APCu to cache found/not-found classes'
complete -f -c composer -n '__fish_seen_subcommand_from dump-autoload dumpautoload' -l no-dev -d 'Disables autoload-dev rules'

# Create-project command options
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l prefer-source -d 'Forces installation from package sources when possible'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l prefer-dist -d 'Forces installation from package dist even for dev versions'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l repository -d 'Pick a different repository to look for the package'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l stability -d 'Minimum-stability allowed'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l prefer-stable -d 'Prefer stable versions of dependencies'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l prefer-lowest -d 'Prefer lowest versions of dependencies'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l no-dev -d 'Disables installation of require-dev packages'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l no-scripts -d 'Whether to prevent execution of all defined scripts'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l no-progress -d 'Do not output download progress'
complete -f -c composer -n '__fish_seen_subcommand_from create-project' -l keep-vcs -d 'Whether to prevent deleting the vcs folder'

# Run-script options
complete -f -c composer -n '__fish_seen_subcommand_from run-script' -l timeout -d 'Set script timeout'
complete -f -c composer -n '__fish_seen_subcommand_from run-script' -l dev -d 'Sets the dev mode'
complete -f -c composer -n '__fish_seen_subcommand_from run-script' -l no-dev -d 'Disables the dev mode'
complete -f -c composer -n '__fish_seen_subcommand_from run-script' -l list -d 'List user defined scripts'

# Dynamic completions for scripts
function __fish_composer_get_scripts
    if test -f composer.json
        php -r '
        $composer = json_decode(file_get_contents("composer.json"), true);
        if (isset($composer["scripts"])) {
            foreach (array_keys($composer["scripts"]) as $script) {
                echo $script . "\n";
            }
        }
        ' 2>/dev/null
    end
end

complete -f -c composer -n '__fish_seen_subcommand_from run-script' -a '(__fish_composer_get_scripts)' -d 'Available script'

# Dynamic completions for installed packages
function __fish_composer_get_installed_packages
    if test -f composer.json
        php -r '
        if (file_exists("vendor/composer/installed.json")) {
            $installed = json_decode(file_get_contents("vendor/composer/installed.json"), true);
            if (isset($installed["packages"])) {
                foreach ($installed["packages"] as $package) {
                    if (isset($package["name"])) {
                        echo $package["name"] . "\n";
                    }
                }
            }
        }
        ' 2>/dev/null
    end
end

complete -f -c composer -n '__fish_seen_subcommand_from remove show info why depends' -a '(__fish_composer_get_installed_packages)' -d 'Installed package'