Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 768A0E00C89; Sat,  8 Dec 2018 02:37:55 -0800 (PST)
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
	*      [209.85.210.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E4FCE00C81
	for <meta-ti@yoctoproject.org>; Sat,  8 Dec 2018 02:37:54 -0800 (PST)
Received: by mail-pf1-f193.google.com with SMTP id u6so3123644pfh.11
	for <meta-ti@yoctoproject.org>; Sat, 08 Dec 2018 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vtN7gn3wxgAi6ZYyl6jujgzp9/ZT9g/cmdCGrfG1jZs=;
	b=aIfvxeWWHeXkj17lr/IxRQg7eaM9iYzXtvOhnQvWMMzNypRteWhpLKoz5fcPtqjlEK
	yFs8CBAlbspmiE4ErMqtZuyBHzZB+ivEKr5p3l1JRD/0pEug502LuBw3DNI3/I/w22oR
	my7+vmXM2y+eZgpSUoH4clCsDkRJtrRTZNvD3kxcumdX6t8gfNrxvWFHNd4NYGFcBV0S
	z58ANNstXMELkSO1FkI31g9LXGFTk3kmm5AWdpXAK/378+hjyDoY2vVatu/OssOqzKma
	rxWgzfNzuNrhkOyQ1NKF4Pob8ceai3LWz5i5Oxc6sC1CifSwoQq0VqT+/pxP/k7do4L8
	KtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vtN7gn3wxgAi6ZYyl6jujgzp9/ZT9g/cmdCGrfG1jZs=;
	b=VMEtZlf7xajy9eRHFNLgWlvFsl/aMl5sxdzm7IB+SVsiLHcrvZmysedj9qdSP0BY8X
	PneYRNpmbSpAvORxrba5c6fHiF4YjbGOwKt7QQ6OS3Cjwguu1pS6WPSOGpe5GAsk5dkS
	WmKRh0+M3GhSX7oPyV96HIhbvPjlZeTWFlPMdkywl1L8SGWUAjw5HzqmjVV1HI87nt8i
	6fxUuaI6UhqKI+KcOKX8Pbh32lDBrlTLm+DJS8BqOZ0X8wIR9904LYlLuV6ktDsKEBUf
	XRVd6v6GpiQyV2Xpm4TFnLWQiXd4fK/XHIUmS1p4WQK6Wr7Mo5Iw7BK8vJd4VaiHuADo
	oW0w==
X-Gm-Message-State: AA+aEWaPvZhpVdwiDDhcYYSWL9YB/h4USOgg1GQVMkYq5/R79qGeG/+E
	IUc+aGG97ZzVQolWiWzDyJyABalsA1U=
X-Google-Smtp-Source: AFSGD/UUIeW1DOzTXIyIxj4FEvzXcsA9yI9IkKwj069QsmImT0rRDD3yB5ib6aChSPhr/W0HSzhHhQ==
X-Received: by 2002:a62:fb07:: with SMTP id x7mr5423486pfm.71.1544265474028;
	Sat, 08 Dec 2018 02:37:54 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id p7sm8499112pfa.22.2018.12.08.02.37.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Dec 2018 02:37:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sat,  8 Dec 2018 02:37:43 -0800
Message-Id: <20181208103743.1576-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH] rwmem: Update to latest
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
X-List-Received-Date: Sat, 08 Dec 2018 10:37:55 -0000
Content-Transfer-Encoding: 8bit

New versions use CMake

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/rwmem/rwmem_1.1.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
index 2848e1cd..24013abe 100644
--- a/recipes-bsp/rwmem/rwmem_1.1.bb
+++ b/recipes-bsp/rwmem/rwmem_1.1.bb
@@ -2,12 +2,16 @@ SUMMARY = "A small tool to read/write memory"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
-SRC_URI = "git://github.com/tomba/rwmem.git"
+SRCREV = "ad00619005654f9cde5c2ea2ed2277d1d3ad2f26"
+SRC_URI = "gitsm://github.com/tomba/rwmem.git"
 
 S = "${WORKDIR}/git"
 
+inherit cmake pkgconfig
+
+DEPENDS += "python3"
+
 do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 rwmem ${D}${bindir}
+	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
+	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
 }
-- 
2.19.2


