Return-Path: <fra.schnyder@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A830C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 14:46:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36872.1788792414666843610
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 07:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=REhyqfqX;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: fra.schnyder@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so43300195e9.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788792413; x=1789397213; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjamZpcmcYGh+Iua/tzmYLpP/NOPaxfP1+sBHkSNq6M=;
        b=REhyqfqXTd3ysO9gAeuSrhF7TtnyQlwxfMTrb9XwQ/P0ytx6YyGuguH7/CfhH7Rwtt
         POirS/MO5Xi/fStFZGA6cemuZ6P/87NL4AEXWkQLkmuCVuzILWd+rArxWwej8zqZs6jj
         b5tGXYSMROYjrbpjG3Wl0ZZTA/Jhpu6Zaz18x9HiplC5raEloPVrk0BbQOQpxcTKxtMN
         uZjIuQVCKXwPbn9MNAtwi7M8t5V8LVI7dwnpIF0YaIPnz0om+QbR8Mbibn38rOq4DsIF
         /cYv2gbj8EJ1EwaEleB/UL+3OWDonS6PTay0mwtR3GgB62BoPjYCGr/FkSlERqB5AoIn
         1W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792413; x=1789397213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjamZpcmcYGh+Iua/tzmYLpP/NOPaxfP1+sBHkSNq6M=;
        b=lL9CPEmnJoXbjjM7p57/pJWr5dMC9a4RnqRRtAFPju1miG/xNe6bN8mEmsNxhK0kiU
         s7ki8kiufhLmnmt8HVcLPe3b14ZhsfX+VfDLXEtk/j+8AP0Tfs1tQPBCKCoPxsCU4Z56
         cKP0EXm3/WoCYa1RUGRqpn2Vm/oZbuiSE4YQysnarUXcO9wHEbgANcM8pUSHMcpRYppW
         R9S+M4IN3zsUX623kGz5Svn9+gbxKvmlsxPb4jqKFLbaGs/agKop1DvPtNhVk6f0p+AF
         5IGc/F0zXHOTjn/KJZiBAaYQdA3QHgQdKDRT9bBo1+qQpZOLImsHrFXgBAXh4buGbM7L
         8CsA==
X-Gm-Message-State: AFuF++lo4bTWu2EvgJ2jrvwN4+MvU9A16E8BQJyFnlgVHiuT9dQRgRdW
	o4UCgX5ZW4RFcE8LDurcse6DfUGbP2dClN84warcnhcTxla5HGtJJzBFNb9bKR48
X-Gm-Gg: AYBFou0pItuMhD0SRIUnbl1R+9aXp56X46YRDCsknjyzf+QZ0poZL/sPKmdws4DXPkP
	wUrKAzrYER/97ds2Hlb2nUxtZU1zcAfaQvqZP9C5U34RAj4WwyZ/g8GNdlGfo40ji+nGwJ/5Dfy
	CJ7nSrh2cd9MxkBNaI2HcKbAMMGJuOvSyXzlVGoS3dzW5Qwt6e4K9UGQ/ZqINW7FWfk2kpCLrLy
	07PPar2XmhMIP2XeOn3DiR+mRLMM5QAMrJlSFvX4LQhM9EBkqC1rKQofwzGfEuKWPlfArurXURV
	oW2AMnd42fzw0UDTuD4gshuiqypanbMPy3Su7zI2XxejdjPK5XZ7oCmiGjolqOT6xxWXNj8r2CL
	9Lf/onU2W2LtxsoLoiAWpBTdvfHZttQDMg2eb2uC9zpNh3RNHxEHfoeHNrIk+kEcuN1tc6qytyx
	X9hClKT8AsJUjVh32/fwq9BxKX18ATK4e96DXxNpJZ4ZSYEEufmrDEQrxtwEfkAn/EY3S3NbZf4
	4YsHozn+BsR3onvzsRQzJgWeqUZvnlrdAkgLSg8MROr8DViZA+v5oE/PFKJGFbCQoBn0W6kg0e1
	/bKcMiHsjchzjh46cGZhOGbf/Z888/fdxKYWmONm7sHdKm9Oc3cX/fizZA==
X-Received: by 2002:a05:600c:4714:b0:49d:462:6eda with SMTP id 5b1f17b1804b1-49d04627387mr140078355e9.28.1788792412848;
        Mon, 07 Sep 2026 07:46:52 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm316217525e9.0.2026.09.07.07.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:46:52 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [meta-ti][master][PATCH v1] mesa-pvr: Remove makedepend dependency
Date: Mon,  7 Sep 2026 16:46:41 +0200
Message-ID: <20260907144642.3994088-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 14:46:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20339

From: Franz Schnyder <franz.schnyder@toradex.com>

Commit 7e696b1fa0 ("makedepend: remove recipe") removed the recipe from
oe-core. Makedepend was removed from mesa already in version 9.1.

Follow oe-core and remove the makedepend dependency from mesa-pvr.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
index 298c30a3..51f27e76 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -32,7 +32,7 @@ do_install:append() {
   fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+DEPENDS = "expat flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
-- 
2.43.0


