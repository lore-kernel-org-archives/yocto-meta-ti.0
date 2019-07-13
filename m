Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CFCAE00B65; Fri, 12 Jul 2019 17:43:38 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.215.174 listed in list.dnswl.org]
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8B79E00A96
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:37 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id z75so5263106pgz.5
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VLXxYcDuTeJT2Pjb7CgkxHdvMq6KU084QCTWs2zkhHw=;
	b=uf4UGGXPu7+ObtO39y7vvImVDucDAcwFsP9CbFi0QEz49/T4Bxp8657sxRJ3OzYxmD
	jgN+kh1Y9hWVmTiclWlCwaNBlNDtyRc5HVO6++PNjA8wqY61HMgT2Kbl+ww2ZtoYU5HJ
	4x0iaUDYjfmEVDtu3dy0f/l49MfPMulzrTWz5j2Fe0xO295zK+ECC4odK2coEW/mi5FY
	vOEFpDt61W1tPMj3EgSFFwbk1NqTxEuTF3cxC4UG/PFlnM65t+m4amU2s7nSZvvdAczF
	igqg90D2XKHzn1wrJh2h0MvE5/S8IFagTavdl+IWFEdILVV9R1JHC70WgOFDXtNvv+xo
	llpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VLXxYcDuTeJT2Pjb7CgkxHdvMq6KU084QCTWs2zkhHw=;
	b=jT6VTWrhNrvxZ2e1sPgwAOybg3k6njuRk4W33oE2Fc5tmb5csLWoGlIv75yGlG1BmF
	TGKnav2cjvERgTKTROF8pYT2msQFDhhMpu2VzSo9LtX4i0aeYY7gqz1HH7LtLIyw6vGL
	JPFKx9xQMx0Mr9uRBmm6cWyrrv+JLobebFxZ6E9fj4mkeC2UZriIsII05Bk1NaN3UhLC
	k0iYYtWU4QmXRNk4YN7rfNThpmMDPSH7NN1UW7RuK6JNznMU8PsSowjPaaqZA/A5Oihr
	K17ql0LZf73HpQpdKV0UjInkXGjzA0fVokp/DsISC0wS+i32BlZgSysqaajCEy+1auqP
	/D8A==
X-Gm-Message-State: APjAAAXvgCBSREjkO5sIij5JKtDUMDDfAnRo1n87kUyhs8G9qqwDVg4P
	VcsFynHkJxNu6y+REqje7GMdCSGg3qM=
X-Google-Smtp-Source: APXvYqwIRfKs6kmUiZrIps7cAAh/W9KA8VqkhihEsuzDfQ/A+4jC0YTg8Lg1Sl7ebuKEDVOZIAlD7Q==
X-Received: by 2002:a17:90a:e397:: with SMTP id
	b23mr15485117pjz.117.1562978616826; 
	Fri, 12 Jul 2019 17:43:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j19sm10547303pgn.19.2019.07.12.17.43.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 17:43:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Jul 2019 17:43:24 -0700
Message-Id: <20190713004324.12695-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713004324.12695-1-raj.khem@gmail.com>
References: <20190713004324.12695-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] jailhouse: Pin to TI SOCs
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
X-List-Received-Date: Sat, 13 Jul 2019 00:43:38 -0000
Content-Transfer-Encoding: 8bit

This needs to be ported and tested with non-TI SOCs
its better to limit this to just TI SOCs as of now
this makes sure that meta-ti can be used in a multi-BSP
distro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index db31bb7d..919c75d9 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -32,6 +32,7 @@ require jailhouse-arch.inc
 inherit module pythonnative bash-completion deploy
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "(ti-soc)"
 
 JH_DATADIR ?= "${datadir}/jailhouse"
 JH_EXEC_DIR ?= "${libexecdir}/jailhouse"
-- 
2.22.0


