import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class UserService {
  constructor(private readonly db: DatabaseService) {}

  async create(createUserDto: Prisma.UserCreateInput) {
    return this.db.user.create({ data: createUserDto });
  }

  async findAll() {
    return this.db.user.findMany();
  }

  async findOne(id: number) {
    return this.db.user.findUnique({ where: { id } });
  }

  async update(id: number, updateUserDto: Prisma.UserUpdateInput) {
    return this.db.user.update({ where: { id }, data: updateUserDto });
  }

  async remove(id: number) {
    return this.db.user.delete({ where: { id } });
  }

  async addUserDietary(userId: number, dietaryId: number) {
    // Check if the relation already exists (optional but good for idempotency)
    const existing = await this.db.userDietary.findUnique({
      where: {
        userId_dietaryId: {
          userId,
          dietaryId,
        },
      },
    });
    if (existing) {
      throw new ConflictException('User already has this dietary restriction');
    }

    // Create the relation
    return this.db.userDietary.create({
      data: {
        userId,
        dietaryId,
      },
    });
  }

  async removeUserDietary(userId: number, dietaryId: number) {
    // Optional: Check if the relation exists first
    const existing = await this.db.userDietary.findUnique({
      where: {
        userId_dietaryId: {
          userId,
          dietaryId,
        },
      },
    });

    if (!existing) {
      throw new NotFoundException(
        'This dietary restriction is not assigned to the user',
      );
    }

    // Delete the relation
    return this.db.userDietary.delete({
      where: {
        userId_dietaryId: {
          userId,
          dietaryId,
        },
      },
    });
  }
}
