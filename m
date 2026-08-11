Return-Path: <antoine.gouby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E1AC5B572
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 15:01:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56438.1786460510096845079
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 08:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cju71v5M;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: antoine.gouby@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so28536775e9.2
        for <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786460508; x=1787065308; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ec5Fm2DSbuyShl0Ty29Kr3SfDS9cIOpZdH0lKAgBsNE=;
        b=cju71v5MeAJZzKHMPwKNNMlzSNH6ow3cfGfoUG1esZWUKxRbaXQKLWUiwJkgwaxjnG
         pNnAIntngiMpTyn9YLmAtRZZkPaYc3uDUz9H/4q9y5uQTdoPkSgdHG7W9JJj9luOKtY7
         j0SoWAVEYQHa3PTpHzYaz4zYV4HDyY71NKzi3KlCqE4AK92+4Wv9t7p8QCe6jJchXcG0
         cTjBypNq/Cr/bTjjh2V+X4L8c6FDVt+0ZT30Ifx7nfTKfIknB1JlDOxJzix/2wweeB2E
         s75u/46mMiyytg1neFyHwN+Z2eGYGmqKiryfr4oQcG6Bml0ddYSMDflQkQmyE8Ahzaqv
         RT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786460508; x=1787065308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ec5Fm2DSbuyShl0Ty29Kr3SfDS9cIOpZdH0lKAgBsNE=;
        b=fBbFKkjtMyNsR0bax8muWFA2MAix6aYmYZxRpyJElGi3j5WxeW1whSKUww10rFfElI
         m5pUfJiCskuyP7YMQfwECeEVEfx9887TCH1qcWaz2qkgOKmegmruzacyfTOTCc+2F8NA
         vcpI9UES4tMenKSebZAuM0ILxxKADwe+BDOyghDVyzs5eT9Ya4d9pzw4bi7PA54DKdDB
         quoZ4LiyHSdyH7RMdOuFgaZ0dCo9b+chF0Fx8OdICCeZIBpu5fgb5+abhoQONs60SgLY
         J5oJGrd/xGaZ1+pUyl8IASuMSTeQPgbO3t7HXsHmZdrQDTTX58rv/S/7hZOF21FtY8g6
         QdAg==
X-Gm-Message-State: AOJu0YxArbJcLoIixmOHGxTpRCtiqWPHysqP6rDHzQ8kB4jU946DV/6O
	VtITVS6Q0Y5jGPc4BvSK17Wwouso1uhxEG9hP1XT0M3QxiXctI//HP1047qDmQ==
X-Gm-Gg: AR+sD10oJvM86trMkha2hWtSUoqJFROebAZdHtcjA6ZKNOF+/CA4ingkn0F0kCEITLn
	otzHb8gmkS9Xlqh4mjW1mhuLYgvCIXG2aabeNRxBjWbBvkxJMTs6FAzPyjv+/ApD+zHttbVIMzQ
	iIeZehifQ/umQSvVa9ThYrpn13WBSNhOKUxSATLP2f7ZpT6mA2Qs70dvv82EGgmLRokp60RXr45
	ahZb6zh2276RhLlO9qKJOKjd1HZ2RxE+Rl3MQ/7TSypfqB3VVFXnJdCwqQrwltReidhjVRL8iGQ
	Qqd+YgayJ7/RBEMjS1a1vypyj9MaUnZnfr4YvICiCna7v0e6IoCUsRBQHzXiQP1PI9z6A3X3PIq
	bVdqm7/mKhfawiIKs8ThH50/Uu7zFunVuY9lyAGFNKJdWMT005UCYlcC6oJaZTON6InEcKPw8F/
	05X96CHOT+pr9RQI4RYigCP6TDGqxoADxyjBkOC5hmh08FouMDnHkvMGRAV9brgWh9t/LqrsMwA
	jZViQduiaxHYoXV2Z3NfIQH5JZ7erdI6OoEHlVSeG6BviwIQ0qIuOTGYSFjDQ0xuin7b27kMmpc
	tXQaqg1MbsZHU2+W1uGddTfEiQs=
X-Received: by 2002:a05:600c:8595:b0:499:518d:ebd6 with SMTP id 5b1f17b1804b1-4997846c98fmr67493415e9.17.1786460507964;
        Tue, 11 Aug 2026 08:01:47 -0700 (PDT)
Received: from agouby.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740c4a87sm70994455e9.5.2026.08.11.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:01:47 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Antoine Gouby <antoine.gouby@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [meta-ti][master][PATCH] weston: upgrade weston bbappend to 16.0.0
Date: Tue, 11 Aug 2026 17:00:40 +0200
Message-ID: <20260811150043.97146-1-antoine.gouby@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Aug 2026 15:01:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20244

From: Antoine Gouby <antoine.gouby@toradex.com>

Commit ad85da159d41 ("weston: upgrade 15.0.1 -> 16.0.0") from OE-core
bumped weston to 16.0.0, but the meta-ti bbappend was still named for
the 15.0.x version and was therefore no longer being applied. Rename
the bbappend to match the new version.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 .../wayland/{weston_15.0.%.bbappend => weston_16.0.%.bbappend}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/wayland/{weston_15.0.%.bbappend => weston_16.0.%.bbappend} (100%)

diff --git a/meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend b/meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/wayland/weston_15.0.%.bbappend
rename to meta-ti-bsp/recipes-graphics/wayland/weston_16.0.%.bbappend
-- 
2.55.0


