function ensure-docker-ready --description 'Ensure Docker daemon is running and ready'
    set -l docker_timeout 120
    
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
