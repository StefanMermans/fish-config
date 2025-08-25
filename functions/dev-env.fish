function _ensure_docker_ready --description 'Ensure Docker daemon is running and ready'
    set -l docker_timeout 60
    
    if isopen "Docker" && docker info >/dev/null 2>&1
        return 0
    end

    if not isopen "Docker"
        echo "🐳 Docker not running, starting Docker Desktop..."
        open -a "Docker"
    end 
    
    echo "⏳ Waiting for Docker daemon to be ready..."
    for i in (seq $docker_timeout)
        if docker info >/dev/null 2>&1
            echo "✅ Docker daemon is ready"
            return 0
        end
        sleep 1
    end
    
    echo "❌ Docker daemon failed to start after $docker_timeout seconds"
    return 1
end

function dev-env --description 'Start the dev env docker containers'
    if not _ensure_docker_ready
        return 1
    end
    
    set -l compose_file_path (find-compose-path dev-env)
    if test $status -ne 0
        return 1
    end
    
    docker compose --project-directory (dirname $compose_file_path) $argv
end
