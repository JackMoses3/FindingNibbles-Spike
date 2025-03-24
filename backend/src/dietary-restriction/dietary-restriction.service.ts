import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { DatabaseService } from 'src/database/database.service';

@Injectable()
export class DietaryRestrictionService {
  constructor(private readonly db: DatabaseService) {}
  create(createDietaryRestrictionDto: Prisma.DietaryRestrictionCreateInput) {
    return this.db.dietaryRestriction.create({data: createDietaryRestrictionDto});
  }

  findAll() {
    return this.db.dietaryRestriction.findMany();
  }

  findOne(id: number) {
    return this.db.dietaryRestriction.findUnique({where: {id}});
  }

  update(id: number, updateDietaryRestrictionDto: Prisma.DietaryRestrictionUpdateInput) {
    return this.db.dietaryRestriction.update({where: {id}, data: updateDietaryRestrictionDto});
  }

  remove(id: number) {
    return this.db.dietaryRestriction.delete({where: {id}});
  }
}
