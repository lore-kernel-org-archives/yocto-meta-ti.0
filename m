Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3086E00E04; Thu, 21 Nov 2019 07:01:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 555BDE00DB7
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2019 07:01:00 -0800 (PST)
Received: by mail-pg1-f193.google.com with SMTP id k13so1735857pgh.3
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2019 07:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ei5fFTZvXSPMEu1KsyXxs92R7jlt9Lg3TPzuzHmToq4=;
	b=rZU/xeg/FE+5+OAajZz3T/tCeTWnqTt4+KycKLLWYpnNCXDtwBE2B5QCVbQZUoCfxu
	aC714Yb8gHw5TKR6jN3vVK/iPrJsm9KnxJwwqKCiTYzCyLeKrqceE5YRYzhaK5Li9Hc5
	W0oLcQ0QKPFXstC+0Q0F0fQ/gCCffxmYhFrkkxNVjWwwRntj2e31UDzqXAXGZLG9JcuD
	4nyi2CEG7T32pH/ft3AK0XLkBsdpiSE7GDwllD9OzS8NMsJq92FMHg79njmE57tFX/AN
	yUw03arklBHBs9/zQkGbesYkVbBqYagNWb6qukBhKr7fwLbAA776t6VQAjYJh4EAhjiQ
	ijkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ei5fFTZvXSPMEu1KsyXxs92R7jlt9Lg3TPzuzHmToq4=;
	b=FymS2QHBWqRb+57mAF/L0UDQhl+3i9VIaOM9aZHEh+chWshxwdI3d9byXBo/S4Z2oW
	D+TyG5vWsl4eIyCzr/xlpOHJbFfyXZpHFJ1n91S/EWnuOv5eIEAgYE1/8aTtJglD26uP
	FHHlJyfW9LIh/95ALSHJTyjKWpQG/z37WmrxOF9PgRm/1f4prhhUUhb0K4FBs9yCB3BD
	qfvndt4n4+bvyQA7pJ9OBYol28FFbX0s46vaqvbyJIWrZ950pggAjxJG+3LCpVZgmHGj
	K4lT4tj97U0mLMY7j21xPO4B9aDN8ZnkvTPzJnBc0TtwA/c2lCw+4u+R+i+uuiAjUUPQ
	izQQ==
X-Gm-Message-State: APjAAAWE6pHVBcwhzWPETrIi138DUPCyMk8dB5n86loMeprWXHSokMo6
	Q4qsSu4CJSTh2CJfkkITwToyp6fnETk=
X-Google-Smtp-Source: APXvYqyRGDd9HdkQgQsSV5rAoOIKeLQqSEthrsnUe6McvM6ob5f5fcwDZRzNeVsubAutXRiGmiNmOA==
X-Received: by 2002:a63:586:: with SMTP id 128mr9710968pgf.198.1574348459056; 
	Thu, 21 Nov 2019 07:00:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	b200sm4023584pfb.86.2019.11.21.07.00.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 07:00:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 21 Nov 2019 07:00:45 -0800
Message-Id: <20191121150045.3811589-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] kselftests: Fix typo in COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 21 Nov 2019 15:01:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-kernel/kselftests/kselftests_4.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.10.bb b/recipes-kernel/kselftests/kselftests_4.10.bb
index 115b0767..f478e56d 100644
--- a/recipes-kernel/kselftests/kselftests_4.10.bb
+++ b/recipes-kernel/kselftests/kselftests_4.10.bb
@@ -186,5 +186,5 @@ INSANE_SKIP_${PN}-ipc = "ldflags"
 INSANE_SKIP_${PN}-mount = "ldflags"
 INSANE_SKIP_${PN}-vm = "ldflags"
 
-COMAPTIBLE_MACHINE_riscv64 = "(null)"
-COMAPTIBLE_MACHINE_riscv32 = "(null)"
+COMPATIBLE_MACHINE_riscv64 = "(null)"
+COMPATIBLE_MACHINE_riscv32 = "(null)"
-- 
2.24.0


