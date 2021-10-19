Received: from egress-ip4b.ess.de.barracuda.com (egress-ip4b.ess.de.barracuda.com [18.185.115.208])
 by mx.groups.io with SMTP id smtpd.web09.7003.1634631752928619863
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 01:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=gneQb0+G;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.208, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198]) by mx-outbound46-213.eu-central-1c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 19 Oct 2021 08:22:30 +0000
Received: by mail-pf1-f198.google.com with SMTP id p10-20020a056a000b4a00b0044cf01eccdbso10577503pfo.19
        for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 01:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1PPKZopLFa3rZtJopAuMfkfE6yzLvLToy/WgOilq9g=;
        b=gneQb0+Gvfr2XuZ+TH99QUsdyWdH4QJuHuAk6rRrf4sP6T7VAHB3wqxTSMqHRZV8JJ
         k7PxKDGgqQGNyroaKWWXyPbgozFhTo0U2ot5iS/6KnqWtTaS+z9SLYtgU3WERewCnRcG
         UumlzJzW49/4cF1WdZeljLfa2l4MYCAF42P8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f1PPKZopLFa3rZtJopAuMfkfE6yzLvLToy/WgOilq9g=;
        b=lW+eGChGHbcl6/J5wGqLDFwh8m1t5MFGtL5FB1SgGpjCQqmYnMfYnZrfW9+UgaEQ7n
         VQmRXf1k0Ilj9Z9Rh5rn+NumtGAWl+Kehb8/wFVyNGALWesTKG2Yg0ZZhfTODq3yWWia
         UCmNBYI959mGjcUJULftipYb3AlEpHBQkVqmVbbK9v4QJ9iyCgoQtkc1R/ni9R3mMBr/
         GPiR6LgZ5K1JjuRDYl3iTmLNta6vpVESDweP8jo2bieR52HkHZQDUWn7jp7VvDOIzItF
         s+TtTHEFQw8nNvOKBohYRtiLz2H/PYnZp86Js4AcgvY3urPqVCq39zCQ5Jf0IAc7oygu
         Yq8A==
X-Gm-Message-State: AOAM532gViXeJClnbrHKZFLpOfb4n3hsouKDqtHdBXV+Z1P9qLB1WWMj
	maSHvDtwW9ezjZhd+QX0/WGCUGt/QSaiT8SW2ZFdqFKPkxQlCgHKKYZyQXMww7hjO269DHLsd9x
	+xnbo1At4U9Hd3eE8UMB4SGtZ4HqgHEIVBd8+iccaW14iz7m5nM6PX5bVYAwlKoU=
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id c8-20020a056a000ac8b0290320a6bb880dmr33342861pfl.41.1634631748734;
        Tue, 19 Oct 2021 01:22:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycY3PqwEkRTrXqavvIG1++VLNfm8KIHZH6ruM9biaw4REmtezjiHEJ96VRslP6FA0zxVT/aw==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id c8-20020a056a000ac8b0290320a6bb880dmr33342837pfl.41.1634631748400;
        Tue, 19 Oct 2021 01:22:28 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.69.35])
        by smtp.gmail.com with ESMTPSA id z2sm15886559pfe.210.2021.10.19.01.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 01:22:28 -0700 (PDT)
From: "Sinthu Raja M" <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-ti@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][dunfell/master][PATCH] conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
Date: Tue, 19 Oct 2021 13:52:21 +0530
Message-Id: <20211019082221.4767-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1634631749-311989-30402-21667-1
X-BESS-VER: 2019.1_20211018.1850
X-BESS-Apparent-Source-IP: 209.85.210.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235256 [from 
	cloudscan17-118.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

The board name for J721E EdgeAI Kit (EAIK) is changed to J721E SK [1],
so replace the eaik dtb with sk dtb file

[1] https://www.ti.com/tool/SK-TDA4VM

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 conf/machine/j7-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index 7cde9f4d..1f47f00c 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -13,7 +13,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-proc-board-tps65917.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
-    ti/k3-j721e-eaik.dtb \
+    ti/k3-j721e-sk.dtb \
 "
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
-- 
2.31.1

