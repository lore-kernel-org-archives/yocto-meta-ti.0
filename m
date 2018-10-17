Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BEC4E00C1B; Wed, 17 Oct 2018 12:29:17 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.194 listed in list.dnswl.org]
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07399E00BFD
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:10 -0700 (PDT)
Received: by mail-pl1-f194.google.com with SMTP id s4-v6so13175079plp.0
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yng0ITNBmfMxkM5NDzDi6XBoDUpHI8IgzUiD7ni92AM=;
	b=cm5DY5PKFaPcPUz46iOHHztzSiEgbNzI3eypf09hmaT4XHSNSwlCTOmqmSKThxXUuU
	1+bKW6vKLUpKkIuz8IeMg/2xZ7vesJjqmRll9X4Qrko1JYZ5SfVEj3ct5C2YZnRMbeGe
	Ntp76/2dHt57ofha9N5kTmJHS8KNFvqXXHg3TxwZ916eFJ3he4+1EPLpf8sCjCbrBlim
	i+wFfYEGdygJfSzLb6Z+DuNGhJRE5243IeoBOYpOa/a0XVny+frrS96pHqyqao6HWT+A
	ErZr9bI89v6WHKLouUEYtBHacYDjqCMywzSRXksi17hMg9hxw6sarkRSDOBULOIAAwLv
	GySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yng0ITNBmfMxkM5NDzDi6XBoDUpHI8IgzUiD7ni92AM=;
	b=Sg/3tkKjUpQQnfxFJ3pIr1JS1DbyXaIE7GVKaTPPuiSdGGIUgEk1XW6/VREWf4eiBj
	sfIKgIXLP+Y2x1e/wPnmCsDsGEDpjQd60Y21ce2fE5N63MiOA8kiD6C6WHrrThbSX7AR
	Yc4Noe3w3XlXcxVHKuUSNy45CgLZOhTwqmcWhoBnV/mk0x4iEq9SDR18xe1TGaplYaNU
	9b91nnDnFzWSBsmZebgvm80TlIML5VmTpkRuNWz4bX5xJ10G/pwHjJqC8WtvyAxAi4Yu
	qyizAjjxzdW0nY3ULOWyP2G91313NjGKpWDqC1cQvVefkhwZ0/U9KVCg631U8H6DObI0
	XIGg==
X-Gm-Message-State: ABuFfoj0EBu+h+/8Y086DIs3D6J7Y98Xwryr+y7YV0w9a/ybXnPE/dYH
	YL9XuHg33c7u/lhKVEEV0MbQxq/HOOY=
X-Google-Smtp-Source: ACcGV63848LSxNs3ocBiGZOFOlf1v/96F/P3S6gMMhEkZteIgE8yMucyv2Y+rlVs6EobNhEul5BYoA==
X-Received: by 2002:a17:902:9047:: with SMTP id
	w7-v6mr27026277plz.4.1539804550213; 
	Wed, 17 Oct 2018 12:29:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	j3-v6sm18044151pfn.175.2018.10.17.12.29.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 12:29:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 12:28:53 -0700
Message-Id: <20181017192853.42942-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181017192853.42942-1-raj.khem@gmail.com>
References: <20181017192853.42942-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] beaglebone.conf: SERIAL_CONSOLE has been deprecated
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
X-List-Received-Date: Wed, 17 Oct 2018 19:29:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/beaglebone.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 9b656d01..f1818578 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -11,7 +11,7 @@ KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
 # Only has DVI connector for external screen
 MACHINE_GUI_CLASS = "bigscreen"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0"
 
 # fall back on generic am335x_evm_config for now
 #UBOOT_MACHINE = "am335x_boneblack_config"
-- 
2.19.1


