Return-Path: <otavio.salvador@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EFDEE00CC4; Tue, 26 Sep 2017 12:48:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.195 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 149B9E00C3A
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 12:48:47 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id i14so7498459qke.3
	for <meta-ti@yoctoproject.org>; Tue, 26 Sep 2017 12:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=wn27aTovgHh8A8jATFzr8P4zf4Sye1TOpicyFcP+fAY=;
	b=KzG/SXUApAOsSCUdC1fJOSsTYum5PA3hoEHY3t6UgKeV8knAYFJ8aB21DGhT85w160
	QIB2Htzxg4KH/RJLJU7SM0+fB8Qsqn+CEfMXEo6HwZK1QtbEQJ5UqHS78QbigLCBER3E
	SVxbKY+61CD0HUK3iIMkX7vTwkWmSoSDsuplhQlkAQO854G8WdtErdKAeT+RQ14XY+XS
	tTQd9Y05Wo5SzMQ8F7s0lID5KdiNn6WfkKdPsPRQ5+vV1iLHF40k6vf9tl46/gSvcHd6
	qQ1f+2CocgErUsEOeWAOwKKhRpAk9IEh2t9z3A1nzFJbzBAD5Txki8kt+EV+/X/Nj78n
	h5Cg==
X-Gm-Message-State: AHPjjUhP73lTIrOEmSH8xW5Q4QkBc2X9y7Rr3czhYKZR/YjV5AULApqg
	Bpf8yTnqZ72C2jsv7V8gWDx6VQ==
X-Google-Smtp-Source: AOwi7QD/SxGsxxGa3VjPjTe/3KLE0MTTL9NbYpicq7IfPbrzSujSbGRWrfGdIzZyyUdWDtshirnKfQ==
X-Received: by 10.233.244.72 with SMTP id z8mr15569461qkl.148.1506455326895;
	Tue, 26 Sep 2017 12:48:46 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	t184sm7238276qkc.74.2017.09.26.12.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Sep 2017 12:48:45 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 26 Sep 2017 16:48:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: meta-ti@yoctoproject.org
Date: Tue, 26 Sep 2017 16:48:37 -0300
Message-Id: <20170926194837.20602-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
X-Mailman-Approved-At: Mon, 02 Oct 2017 15:27:50 -0700
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] Stop using linux-dtb.inc
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
X-List-Received-Date: Tue, 26 Sep 2017 19:48:48 -0000

The Device Tree support is now handled by the kernel class. This patch
removes the inclusion of linux-dtb.inc from the kernel recipes in this
layer.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 recipes-kernel/linux/linux-ti-staging_4.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 0898523f..5de1c756 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 inherit kernel
 
-require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/cmem.inc
 require recipes-kernel/linux/ti-uio.inc
-- 
2.14.1


