import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { DatabaseModule } from './database/database.module';
import { UserModule } from './user/user.module';
import { DietaryRestrictionModule } from './dietary-restriction/dietary-restriction.module';
import { UserModule } from './user/user.module';
import { UserModule } from './user/user.module';

@Module({
  imports: [DatabaseModule, UserModule, DietaryRestrictionModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
