Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3758DE009D9; Mon,  1 Oct 2018 08:47:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.210.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01352E0090C
	for <meta-ti@yoctoproject.org>; Mon,  1 Oct 2018 08:47:02 -0700 (PDT)
Received: by mail-pf1-f195.google.com with SMTP id k19-v6so9531294pfi.1
	for <meta-ti@yoctoproject.org>; Mon, 01 Oct 2018 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WIJB1FgngnnMIlzWAVWKjYeLM+czz8dY5Xh1pkgbedk=;
	b=GoTfX/dIXRcYlylI77DsKhraJWsNPS2Msllvu1NnsTEa0ofTAu07NKcxEbKxJ0mDfw
	3wR0UPslVyjE9QjmQRqpNhKY8NmEE6M3B4zRI5S64I2P8bGHxtjwLeI7SGgF3Bg7vOBV
	kxp84Sc94Ts85jotDP5yn5/Di0SBVyfAZJo7p/gir2oyYlxXOAn7Awfyhvs7C54ibwE3
	o2Uu6y/FZf/+A+5q+OBu0X/eVvJ9oKCKSPA+ZQ2w3CPbZ68dge5O9l0+UcANao0bmhlH
	SvoaekGnq8rT5DUeSP9VqIoc4AfKVD32nFTIzB1BmWVBAyJwVbweNJzdbbuZMuFsRNaC
	VSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WIJB1FgngnnMIlzWAVWKjYeLM+czz8dY5Xh1pkgbedk=;
	b=j0urbYSw+7nk0CtkCKC6EUu19lpjfw3MsFXymcHSdSvwSAqHVF4rf8ZtlpQpeH/dzw
	IHy2CgM6ifpsdzGO/9KgURltxCh7sz0WfMQ0GIXwXqhxxVDBOPUXYZZB3HxPAaLBAknj
	9jT1cRjt7+plOcKFNSQhmBZ3p8reL/teVMmt+iguHbPIPyJKv3olh6KVLjDTGK6E1PMi
	yNwiyCBXpqe1sZA8F/PLX8wHlM/fLUI6rETiG/w5zGoWn2DYlAhRdRy+6q67IE/Bpxu3
	b76scqlTbjcg5ojcG+TDN+wYIGcRHDz/ce/LwryVMhjnnxToa/yl69Jlb1O2zqKig+yF
	Xs0g==
X-Gm-Message-State: ABuFfoiH9GciIa61Y/G+KxwRjinZroenjd2+ZMxGoz4RTu+4NVyjGpnW
	qjQu+dWbgqkcuHGFU+XSsBq3gYso
X-Google-Smtp-Source: ACcGV62AOGoK36URUyF0yuleBqE/RtovnRqCZgrniX05BM7sRoE8Pl7r+OyPmWowprwkj5hvw5WosA==
X-Received: by 2002:a17:902:24e7:: with SMTP id
	l36-v6mr12552724plg.234.1538408821952; 
	Mon, 01 Oct 2018 08:47:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	a79-v6sm21166733pfa.124.2018.10.01.08.47.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 08:47:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  1 Oct 2018 08:46:54 -0700
Message-Id: <20181001154654.35293-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH] layer.conf: Add thud to compatible layer series
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
X-List-Received-Date: Mon, 01 Oct 2018 15:47:05 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index cfa97783..824443d4 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "sumo"
+LAYERSERIES_COMPAT_meta-ti = "sumo thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.19.0


