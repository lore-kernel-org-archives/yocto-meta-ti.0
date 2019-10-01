Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5156BE00D4F; Mon, 30 Sep 2019 23:36:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55CBEE00D35
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 23:36:50 -0700 (PDT)
Received: by mail-pf1-f193.google.com with SMTP id q5so7174429pfg.13
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bn4z3iInj93UPoo0CaHoVDypMDEsYrUZyVtTTXIPFl8=;
	b=hSRzWrWNy54t6kZF6BAiNs07sX0kpIz5MvD2k/YSzP8uClcAJLfIx4SbV3flWxSOZL
	qreGToupxOsJ0ORELLr8zw3Svo13XsCLUqZUrnChBLQhCJzY/RnAmidp5PFa8Ih/UhDr
	wVBlBJINWTmjxERO8vcQtWmjBa5kxj85IX4WHKwSNNkR+n5HiXHlWsursWEMbbIDbfyE
	sZVA4iFRgI3nb32lEdQgIs1Kn+VjsGeH46rScIWZHGaMnfP+gDrZl2R/1S3rUIv/sjvB
	EeRqUAE481o7E/DbX2A0pNR1WvQeQf3Hymjl0ZwDaml+H1lNy1/1lrtDlMn2HfQMbJtl
	LBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bn4z3iInj93UPoo0CaHoVDypMDEsYrUZyVtTTXIPFl8=;
	b=MVPS46RiF75dtEsMWHmOarEtiY/r331D3RqIrkwnadeLqqUFHNDrofKv81G97/GjwB
	ENRAeJ1ID4kvBjvUsTzhYL/e57bNDpD31yKA92UgMrpBw0nfrJxn6l41lQDp6WomWKMD
	UF2dXJqNkCma6fdiF2oeprkmDion0gpP8/LjqiwUe0H4t05IygDQznV1MoiXKsaQlpg5
	jwPX8bdOXQeKQnjyPLhSP0ET1rHEa8AaQmlllPHpW2negmKbOchl2+QYJVNnLQZI6wQA
	MzU9Axm/0E8It4cCB8y7XDYMqPtseGFsbxDe61HmanPUCO2czo65xDi87lg+eDkvxn10
	DSmQ==
X-Gm-Message-State: APjAAAVNgiN7ZGcG04Vt9Q883NAIhUpFeOZlqgHzbF/v8c8WdPmto/TC
	/MefhfHBzqquKzTTSs2DXXLaA1f8kPo=
X-Google-Smtp-Source: APXvYqwoZ8nVSS99/MVTvdN5NQdiFAL13TBgid3Q+Qonowm0e7y3dmm81ZAtNKW4STiwfFelPW3OIw==
X-Received: by 2002:a63:ea07:: with SMTP id c7mr29733238pgi.106.1569911809273; 
	Mon, 30 Sep 2019 23:36:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	n3sm12961850pff.102.2019.09.30.23.36.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 23:36:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon, 30 Sep 2019 23:36:39 -0700
Message-Id: <20191001063639.467063-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] vshmem-uio-driver: Make it ti-soc specific
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
X-List-Received-Date: Tue, 01 Oct 2019 06:36:52 -0000
Content-Transfer-Encoding: 8bit

It rdepends on jailhouse package which is already marked at ti-soc
compatible only, so in a multi-BSP setup it ends up breaking builds

ERROR: Nothing RPROVIDES 'jailhouse' (but
/home/jenkins/oe/world/yoe/sources/meta-ti/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
RDEPENDS on or otherwise requires it)
jailhouse was skipped: incompatible with machine qemux86-64 (not in COMPATIBLE_MACHINE)
NOTE: Runtime target 'jailhouse' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['jailhouse']
NOTE: Runtime target 'ivshmem-uio-driver-dev' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['ivshmem-uio-driver-dev', 'jailhouse']
ERROR: Nothing RPROVIDES 'ivshmem-uio-driver' (but /home/jenkins/oe/world/yoe/sources/meta-ti/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'ivshmem-uio-driver'
NOTE: Runtime target 'ivshmem-uio-driver' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ivshmem-uio-driver']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
index a9f14552..39a75533 100644
--- a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
+++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
@@ -17,6 +17,8 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
 
+COMPATIBLE_MACHINE = "(ti-soc)"
+
 do_compile_prepend() {
     cd ${S}/kernel_module/uio
 }
-- 
2.23.0


