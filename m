Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76579E00AF2; Fri, 12 Jul 2019 17:43:35 -0700 (PDT)
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
	*      [209.85.215.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3F67E00931
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:34 -0700 (PDT)
Received: by mail-pg1-f193.google.com with SMTP id z75so5263082pgz.5
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pg7SACcZPy7cExJwyukz4lp/OF8flz7GV8G2q3gmVsY=;
	b=b2rrL1JG7tUsvAgR4mDUOJ04naDri1+W285sCOs7xhjNrad3oFKe73/3GqyVtxnZKA
	vu4/mC18frcOvg0WZJgSDRdY6P4M7onYdoAtXY+q87QVNJC3uok/TmCktJDn/MaxBuW8
	Zh6DsDgLBZSlFwiz+rlb6cniPmXGeNT8yGDIcN3iscEE+Q03kYVx+SesZdW2MrOCkSL3
	5BXHQ/8lPVwE5EJ2+hBAcuQs5VCtpA8iTvykWpo9FUdIZy3MOD6rRlU+WPGzO04IhK4P
	xNu4a6kDHAUHcwn7R0oT2LRLS2YuBNYHUyZm9zBaYgTGdlPICmJij9aE53OA7zDf6cxM
	jNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pg7SACcZPy7cExJwyukz4lp/OF8flz7GV8G2q3gmVsY=;
	b=Hw5/clgogJOFitRd6y8HG8wEwERxIsS8mCtrhfZ61h2cZRCr+9fW3VO/ThapP+elmb
	nbPCnm63V25bVBisHO0FwMPe9dSjNF25+TAb3DFlDBaod1tIeRQtDYia0rfZiKkzNP4X
	hOVK5wu5yRKP2AwY2s0B3sSRps25pszTLwWeX8lrc/24KfjlK4M7rdIRkNkUpjmpubEo
	1iQLmip0E/trb7J34taWbCBq58bMBJnMRJyaZrSvydKhhp62YHcNoP+Z/0mn8sIRnYx+
	xAxfBvOHRHmgTflQFmsFYuSwIHClW9tFYgPcxbaT9uxrMVkEB8LruhCDx35C6Tt74SJM
	iMHA==
X-Gm-Message-State: APjAAAWiC8Q2E8NrcM/9cfX4WqjhDvX7er80skOj3nwlOuX0jLAT1NxX
	724TalijuVmQk8hgyeFcQM4uZcR02xU=
X-Google-Smtp-Source: APXvYqxVXUuzsxdsNi4p2EDr/3GJdQ+Q+ayid4aaMdW1qhexxydy1mENunUZp6yQGKI4gx5bUW1cZA==
X-Received: by 2002:a17:90a:21ac:: with SMTP id
	q41mr15708368pjc.31.1562978613852; 
	Fri, 12 Jul 2019 17:43:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j19sm10547303pgn.19.2019.07.12.17.43.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 17:43:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Jul 2019 17:43:21 -0700
Message-Id: <20190713004324.12695-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/4] ti-display-sharing-fw: Do not strip during staging sysroot stage
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
X-List-Received-Date: Sat, 13 Jul 2019 00:43:35 -0000
Content-Transfer-Encoding: 8bit

Fixes build with non arm architectures

Subprocess output:x86_64-yoe-linux-strip: Unable to recognise the format of the input file `TOPDIR/build/tmpfs/work/qemux86_64-yoe-linux/ti-display-sharing-fw/00.09.00.00-gitAUTOINC+4a86f16df9-r0/sysroot-destdir/lib/firmware/ti-display-sharing-j721e.bin'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
index 675b3f2c..db095d90 100644
--- a/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
+++ b/recipes-bsp/ti-display-sharing-fw/ti-display-sharing-fw_git.bb
@@ -36,6 +36,8 @@ ALTERNATIVE_PRIORITY = "9"
 
 # This is used to prevent the build system to strip the executables
 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+
 # This is used to prevent the build system to split the debug info in a separate file
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 # As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
-- 
2.22.0


