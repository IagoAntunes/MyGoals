﻿using MyGoalsBackend.Domain.Models;

namespace MyGoalsBackend.Api.Repositories
{
    public interface ITokenRepository
    {
        string GenerateToken(User usuario);
    }
}
