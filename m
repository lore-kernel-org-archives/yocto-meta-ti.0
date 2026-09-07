Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA1EC79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 15:49:00 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38257.1788796129609173226
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 08:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BLhI3sy7;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843e397f74so4522880f8f.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788796128; x=1789400928; darn=lists.yoctoproject.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2ojN9kjwPLwp6cdu1sl3PeBmSvkQmLatZYwiL+KgCg=;
        b=BLhI3sy7LGRvYxy7/iyEBlWV+8OW98d/f5x8L+lgV4lQ4kRDPJT6xlqWoMf2wiRFF/
         ku6Mlq4H9po3NFF5FdkkNhfIsGsOAvaBEzJlxSIKE2447EDDExDGCRbMcd77Q6luWuKM
         sDgdwQQzY/3OTJc+xyko6Q0VXcsrka8sKpt2RMz6UKTRlKi3n42hMV+BAfM84QLlwdaB
         DD3QBB/YQTGjK4Ud1pX8NkXn3BI0Yce+uSwA3YnbxvTITeFUXbfUaWKDBkSPwDk0Jz7B
         iMSXlTT6Xyd2UWHVb804w5QQr59/8rDADwcUmJuM/Dye0ML8t15Zai3i8MDNsxCq/GYn
         xUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796128; x=1789400928;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2ojN9kjwPLwp6cdu1sl3PeBmSvkQmLatZYwiL+KgCg=;
        b=cGJasyFduS6ttb4z5ISzwXooy4LnskuwekEdpPEhHn6fEUCSBvbxxOAFDN9tHRWe9d
         VxQLrHSWQKTBcpOgiJXju1TUhJHfUCrrxEptvk7MmzEBjYrLVZ29ufr5o31Md4CfY7qh
         0D0UbQOTMfNuez2y4bqMiXRRc6Cb+9RoXqz70OufGlUNL89Nmp/hBfrhzzHbm5u2RhAO
         XpIr1SWvtUBSbTfFXjMskYM+ykXdhPKWiySOfOLJ9iTmhZDyaqvT1ZUAw3mBvWAZdOaN
         sPgdS8QoVaRoGH5I0V7CT4vYwZGVu2vd+6/DT9B3tZ3ecx56RpmBh31zdpokIRAq2RwO
         HGqw==
X-Gm-Message-State: AFuF++myEaxdlvSc8i2E99/lkiGzObjm9DgNLo5Nc/P2SEvVKoAUZCTr
	xPdKnPvJi9p/8nQa7qwoBiQ1UqpXuyjBE5umw+aU2cx46ikX217RImEMnjcVmhqk
X-Gm-Gg: AYBFou1yPla7FbIsi8XIEEYH+VoRMyxdwYUt0ZwvbzGrm4duEON52oWNZCFn2D8OfIn
	smA+uCLIE0a3I1rbj64Y5xE5eROPebpKjgFdfh6s3CLurrniFmUF5w4wYMOYhQh7uNRAQebS3ZX
	wLH+te2OC/l50dQ+nYeFWE2tUKK6UO/8n7PLec4xAAQvWTwF5SuvUbiRpRrfXTp86soeIxDAjGJ
	HnX1wldBAeGvXY75/roep1bbQySut3bsvxdKiHLVVbQ1zvwLPDLjR9IRLrpWfJ7qY8FFU4G05um
	yTYOBq/GvHHm89U6t0QazJOA6cCnbwN8TZvZNrTYyjDfoN32pd7Mim+ATu25WzypTU9itZoSAM5
	xWrkbrHz2rJWl+izckIoXNzfLozyQ/xKYYD4wSM2CXyoUAAaCry//evm7PLLHyQIrHpIQ/WwDXP
	XJlTnP7CcI2lhxr9sX9lK58wzD1wgbsmOj5dDJ3eMfi+zfIXsISVEWgCjhE2HMndXqx55pybHnF
	Lq6ng1yBlZE8PCDLTz5qUVnmIi/MxUaCE2RzcpFMvaAmhVrrjwBX1y+DnNwD2EE5s8uqc7otODr
	QpX31QOl8C0T88QS3/HQYHE7dM3eQ/KRSAEH
X-Received: by 2002:a05:6000:2c0c:b0:485:8d9c:47d2 with SMTP id ffacd0b85a97d-4858d9c48afmr20647592f8f.30.1788796127757;
        Mon, 07 Sep 2026 08:48:47 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm30563010f8f.34.2026.09.07.08.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:48:47 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:48:46 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Ryan Eatmon <reatmon@ti.com>, Francesco Dolcini <francesco@dolcini.it>
Subject: [master] mesa-pvr/libclc broken after LLVM 23.1.0 upgrade in oe-core
Message-ID: <pyqpmssd7hwfvotynswv3mhg5bqkaa3fdvctg2yvuydurvegvi@n2gbtvs6wn6h>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 15:49:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20341

Hello,

In addition to the patch I sent earlier to remove the makedepend 
dependency [1], we are experiencing issues with our builds targeting the
master branches. There is a problem with the oe-core clang/LLVM upgrade
to 23.1.0. libclc fails to build and therefore also mesa-pvr.

| The no-dev option is deprecated.  Use -Wno-author instead.
| -- The CXX compiler identification is GNU 16.2.0
| -- The C compiler identification is GNU 16.2.0
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Check for working CLC compiler: /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-gcc
| CMake Error at cmake/modules/CMakeTestCLCCompiler.cmake:29 (message):
|   The CLC compiler
| 
|     /var/home/scf/build/BSP8/bitbake-builds/tdxref-master/build/tmp/work/aarch64-tdx-linux/libclc/23.1.0/recipe-sysroot-native/usr/bin/aarch64-tdx-linux/aarch64-tdx-linux-gcc
| 
|   is not able to compile a simple OpenCL test program.
| 
|   Output:
| 
|   aarch64-tdx-linux-gcc: error: unrecognized command-line option
|   '--target=spirv64-unknown-unknown'
| 
| Call Stack (most recent call first):
|   CMakeLists.txt:20 (enable_language)
| 
| 
| -- Configuring incomplete, errors occurred!

I tried to understand what is going on. 
As oe-core removed libclc, a copy was introduced with 
commit de61ea26 ("libclc: Import from removed oe-core recipe").
However, with the upgrade to 23.1.0, libclc changes how it detects the
build compiler. 

Due to the constantly introduced breaking changes from LLVM, mesa itself
moved to its own libclc fork with mesa-libclc [2].
I tried to follow a similar path for mesa-pvr-25.inc:

  --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
  +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
  @@ -206 +206 @@
  -PACKAGECONFIG[libclc] = "...,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
  +PACKAGECONFIG[libclc] = "...,,mesa-libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
  @@ -239 +239 @@
  -RDEPENDS:libopencl-mesa += "...'libclc'..."
  +RDEPENDS:libopencl-mesa += "...'mesa-libclc'..."

+ dropping libclc_git.bb

mesa-libclc builds correctly, but mesa-pvr do_configure then fails:

  | Found CMake: NO
  | Run-time dependency libclc found: NO  (tried pkg-config)
  | ../sources/mesa-pvr-25.2.8/meson.build:873:12: ERROR: Dependency
  |   "libclc" not found (tried pkg-config)

I got a bit stuck on what the correct approach would be.
Adding a patch to change the dependency in powervr meson.build source?
Before spending more time on it, I wanted to report this here first.

Any ideas how to proceed?

[1] https://lore.kernel.org/yocto-meta-ti/20260907144642.3994088-1-fra.schnyder@gmail.com/T/#u
[2] https://git.openembedded.org/openembedded-core/commit/?id=2614dd44ed724844df13d44b7cb6f8971925b0a3

Kind regards

Franz

