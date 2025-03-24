-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DietaryRestriction" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DietaryRestriction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserDietary" (
    "userId" INTEGER NOT NULL,
    "dietaryId" INTEGER NOT NULL,

    CONSTRAINT "UserDietary_pkey" PRIMARY KEY ("userId","dietaryId")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "DietaryRestriction_name_key" ON "DietaryRestriction"("name");

-- AddForeignKey
ALTER TABLE "UserDietary" ADD CONSTRAINT "UserDietary_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserDietary" ADD CONSTRAINT "UserDietary_dietaryId_fkey" FOREIGN KEY ("dietaryId") REFERENCES "DietaryRestriction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
