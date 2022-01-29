Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.13507.1643502876562797380
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 29 Jan 2022 16:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bLDT27Tj;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id q5so8932712qkc.1
        for <meta-ti@lists.yoctoproject.org>; Sat, 29 Jan 2022 16:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ueI4Ony2WG1fZrY67qUWO1B/PmojOhCjylxU9thw0m0=;
        b=bLDT27Tjhj68m8RzGvhBJGkLggamLdhVnJU2fvsR5RYjm7bpHcp6nX/RdxxsMr+gll
         5zeM5VQLIN5zdanjXvIoMQ6JcBpedhdh94BGv2eThMoY1bHBGjJfkY1p4LC4AxvU51cj
         nyFYJIBNLKnvHn20y5JU2/R+n+i/Dizg1PslotMzZThrWcHRQ0C3RkK1mg/n+9Ckkt+b
         /4H2gYcdgu1dRXtnBtYQyBw3LoSHQF8m5IqtXP7ATfTJ+3NjNKgnxLg1VQquN76d2864
         yrzA5Ra5NttGyVd4XcYfsNuP1bZsWNvqN9t+MH36PrjJX6o9HwdTs8b+Ljfpvk0cIhVa
         pNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ueI4Ony2WG1fZrY67qUWO1B/PmojOhCjylxU9thw0m0=;
        b=3ZzI+nssL4TrByVDMWxZABD/r/PIQB/fMkqqeGvXDYqsTzQxBXGi/C+frPLRrfZIW8
         hV73xlQQeFpKAY+m3l1U97t3s941pSVvmwh9T6ke38jLxPI25uCexhWaaNLkcwhtxr2+
         ZuxeJlVwvJHC4KHM2D2mRmCvn2CDC8KhO5NOet08mO5QqIzAmk9QMPVv8cI8w1q6Ftde
         2jtKteryoA/tA98UxIzBTfKJ2/jqtqfRxAxWqH3IX5QyAKd8w1s6mD5VGT6+W7hM6q72
         hioAFvPexKrslZ/rXP4JdgLmlXNdFQ3IFK6VoI1ELvGOPPulvWBMqOSTDicuE7TZc0up
         Qw+g==
X-Gm-Message-State: AOAM530OJaV8qq50Egi2YOoT9d/TrPWE03Vn4tMKX7imKJDcMgXHKCo8
	HgpEHLZGqQM0asirHD9iGcPGdhIUp6U=
X-Google-Smtp-Source: ABdhPJwDChOVnD3RJeXOEVWV97F7nMsuMIYZ7kw/DPwmlE+rqLqHW5HqfmOiKLLcAqM4hqn77wsavw==
X-Received: by 2002:a37:dc07:: with SMTP id v7mr9229163qki.629.1643502875530;
        Sat, 29 Jan 2022 16:34:35 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-211.dsl.bell.ca. [70.53.240.211])
        by smtp.gmail.com with ESMTPSA id u18sm788306qta.76.2022.01.29.16.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 16:34:35 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Vivien Didelot <vdidelot@pbsc.com>
Subject: [meta-ti][RESEND 1/2] beaglebone: make kernel machine-specific package
Date: Sat, 29 Jan 2022 14:33:19 -0500
Message-Id: <20220129193320.2945618-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require kernel image and device tree as machine-specific packages with
MACHINE_ESSENTIAL_EXTRA_RDEPENDS instead of appending IMAGE_INSTALL.

This binds the packages to the packagegroup-core-boot package group,
allowing one to skip their installation, e.g. for container trees.

This patch reflects commit d4cbe0e43393 [1] from meta-yocto-bsp
("beaglebone-yocto: move kernel and dtb to packagegroup-core-boot").

[1] https://git.yoctoproject.org/meta-yocto/commit/?id=d4cbe0e43393ec70e98caf006372b5311597d377

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 conf/machine/beaglebone.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index dcb14cc9..fe3127bb 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -13,7 +13,7 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-IMAGE_INSTALL:append = " kernel-devicetree kernel-image-zimage"
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-devicetree kernel-image-zimage"
 
 # Refine the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS = "bbbAM335x"
-- 
2.35.0

