Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 69ED5E002AB
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 23:16:28 -0700 (PDT)
Received: by vcbgb22 with SMTP id gb22so982504vcb.35
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 23:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=UAf6+rTK3CCiqXjzG+DbcOSXfZww9aaExI7mGrpgrXY=;
	b=NivuDwyCHvThAORA/y8X1TCFc6ylNEwsfcmDqrbdNSemteKV5MFfhav1FBAojznScE
	JEo1XUrcotHllu3Om2kVOrud8G4cR0Pt0o3dZ4XoAGGfUzqCSuttUG8Xcjhdzf5d4gB1
	smrqUBRWlNWIqkUdFhfQNObu2CHKna1M3YFLgWsuw9MTbpRf+Db74v3aWG/12lOIMd1Z
	kJpsA0TBez34X5ifxsTpXh1Fbxwl+BVceQhbJ8MfHAdpQUv3kzvaonC3dbbrZ9kRawIE
	jcu1Vu0CuP+cs5Hc5sQW2rlGNRdMkVKo34jeJOHLjZ058vQoMYaDd2pa00++66iLjx3Y
	fhKg==
Received: by 10.52.19.243 with SMTP id i19mr1129345vde.69.1348035385483; Tue,
	18 Sep 2012 23:16:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Tue, 18 Sep 2012 23:16:05 -0700 (PDT)
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 19 Sep 2012 08:16:05 +0200
Message-ID: <CAOT3mi+f4Wsaba4S3uiw1p27R585EBY4OSA8K=pPCpbATwRmcA@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: building yocto images with meta-ti
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 06:16:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi there,

i was able to build a 'vanilla' yocto image using the yocto git repo.
then i wanted to add meta-ti layer. so i have done the following:

- clone git://git.yoctoproject.org/meta-ti
- modify BBLAYERS in conf/bblayers.conf to add meta-ti

i can verify that meta-ti layer is configured properly as
bitbake-layers show-layers shows it just fine (with priority 10).

However parsing recipes failed with:

Loaded 23 entries from dependency cache.
ERROR: ExpansionError during parsing
/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb:
Failure expanding variable FILESPATH, expression was
${@base_set_filespath([
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e",
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
"/work/yocto/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
"/work/yocto/meta-ti/recipes-ti/local-power-manager/files",
"/work/yocto/meta-ti/recipes-ti/local-power-manager" ], d)} which
triggered exception SyntaxError: EOL while scanning string literal
(FILESPATH, line 1)
ERROR: Command execution failed: Exited with 1

is there a particular commit in yocto that meta-ti requires?

how do you guys generate vanilla yocto images with meta-ti?

thx

