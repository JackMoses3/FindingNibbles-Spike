import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { UserService } from './user.service';
import { Prisma } from '@prisma/client';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post()
  create(@Body() createUserDto: Prisma.UserCreateInput) {
    return this.userService.create(createUserDto);
  }

  @Get()
  findAll() {
    return this.userService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.userService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateUserDto: Prisma.UserUpdateInput,
  ) {
    return this.userService.update(+id, updateUserDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userService.remove(+id);
  }

  @Post(':userId/dietary/:dietaryId')
  addDietaryToUser(
    @Param('userId') userId: string,
    @Param('dietaryId') dietaryId: string,
  ) {
    return this.userService.addDietaryRestriction(+userId, +dietaryId);
  }

  @Delete(':userId/dietary/:dietaryId')
  removeDietaryFromUser(
    @Param('userId') userId: string,
    @Param('dietaryId') dietaryId: string,
  ) {
    return this.userService.removeDietaryRestriction(+userId, +dietaryId);
  }
}
