Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 799B3E00B6C; Mon,  8 Oct 2018 23:19:02 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 419FCE00A86
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2018 23:19:01 -0700 (PDT)
Received: by mail-pg1-f195.google.com with SMTP id t70-v6so267007pgd.12
	for <meta-ti@yoctoproject.org>; Mon, 08 Oct 2018 23:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qv5lQGxsw3wbubK5Ufz8zo596F7iCTbqPK7ArlTjYeY=;
	b=uYnERm0ZxFWv0loCp7h4yOISgrkvwBTMSmqjaRlzkhUKYYQvqXrD/Jha5THa4QRh/4
	wIOqsaA3Z3zw2uHyqOVi4M1xmlzIHPHxiAyl2podB3d1sK6PtG77t1H4XBFAfWxG2ou0
	0dyoY9yEB0+iZd0jHV9+C80OY5MljsRjE53xKpFlsWWee3UaxpG6d18rAuN0tqjksB4O
	lUI225XuqYrOHkB7m+z+SkY4aahJiT69Zrmhs6C7LpJdf8ez17fyvXv64qBCL57+4U8v
	alEbpSXnnEN/1pzialfyba3ymKnuXr+lyjYtknlGWGiwfXATgen9OwVge53COh+pwz5G
	wz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qv5lQGxsw3wbubK5Ufz8zo596F7iCTbqPK7ArlTjYeY=;
	b=hfua1QKVzU6ekSExJRRv8WK9wqak8I649yyLg0J935BOySXOWVxBjp8F+L2zSPbzRd
	05rvA6TU8YGew3oGBMBd+aqLvAoa0DO//0wEaP5rhabilF5TQbul6TM6vSmnSWyo4/8/
	WSeBI8ypeW3vM6Mv+pGoVfZMaTw5G0reEobHSal0gXkxtLOz4fNa0DolJvuh99rNdWuZ
	izkCTyKOqmSc6BzIHLZBlgpuXPClryKhwZ5JDXrmV/eyuYT0tJhHD4HIYo8tdl13xanQ
	BBHwEx7NlPTSXsnCZ2bGW/Ha5JZXkky8Y3dZ5bVEor7H2sj4nTS0LPMy1rJqmJMwLu7w
	dMbg==
X-Gm-Message-State: ABuFfojKhXZ5nXpEF8LxqLDSrMzwmNnnYQPIsqkz0mqtuBNlQ4OHeCEc
	xDiSOUuE/YVGjGkgJVv+PR1cwEQe
X-Google-Smtp-Source: ACcGV61jnYmpdFJw12UfwQvLNUEqOFX9KNPRPr6EHiOjOsqIIJUfanyclEPGX/20/pvya+Xl7MhdGA==
X-Received: by 2002:a63:4614:: with SMTP id
	t20-v6mr24890558pga.438.1539065940401; 
	Mon, 08 Oct 2018 23:19:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	i2-v6sm17823466pgq.35.2018.10.08.23.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 23:18:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  8 Oct 2018 23:18:49 -0700
Message-Id: <20181009061849.5757-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] doxygen: Set DISABLE_STATIC to be empty
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
X-List-Received-Date: Tue, 09 Oct 2018 06:19:02 -0000
Content-Transfer-Encoding: 8bit

by default its set like this
DISABLE_STATIC ?= " --disable-static"

but doxygen configure is not typical autoconf
generated so this option is not available, its
better to keep it empty so it can work with
dustros which disable static libs as policy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-devtools/doxygen/doxygen_1.8.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/doxygen/doxygen_1.8.9.1.bb b/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
index 27560fdd..eb43e741 100644
--- a/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
+++ b/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887
 
 EXTRA_OECONF = "--prefix ${prefix}"
 
+DISABLE_STATIC = ""
+
 do_configure () {
 	./configure ${EXTRA_OECONF}
 
-- 
2.19.1


