Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7213BC3527E
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.8070.1650729557004649841
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 23 Apr 2022 08:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AN12uwmq;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d15so17403472pll.10
        for <meta-ti@lists.yoctoproject.org>;
 Sat, 23 Apr 2022 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lpQOx2n0MbzNaK5KGnPtoTVi3OIa+T7Hmbei1DlyIvs=;
        b=AN12uwmqhlO+3OxLnY5jjkF2xsQ45aGRUrLcfwLw7jPAxLnhjlWhfGryiBggeSoPUR
         GOLfTL3REG83f6ReCgREiQlAMT7WTR2gm3f3o/4cznGMgajTRRf3f2CPeICr1yQNGvcl
         x/kLV2wznAWNC1fxiVcpP4CfgGP0sDK0ihYKJ4W0WJn8KnO+sonNdZzbRHg5GggDdPmC
         Wk3+4R+R9vOd8gF5ebO07hIJVafJnBkMs1TMokylQHxReksadSA2VQ7yh8qA56bSv0Jk
         cvjWFjr+UyUDM1JGWPQa4TjPfuGfCdr/hU9Om5UjNYQiLi98lT8a8hTKdhAn7fFLfuN0
         lOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lpQOx2n0MbzNaK5KGnPtoTVi3OIa+T7Hmbei1DlyIvs=;
        b=HsYXE2JF6QQGRodKiwf8nktWG/BxupOMT76XOlRf+8SEAINORP8XaqyyOIldOnThql
         ofp7X90yIVKkbpWpt3I3bs6Z7FMaaTE1aOy/9xrl8VzCeOpch6yKOZ7EvYQXaFHlaGjd
         SaWtFMjm5+3pbAMUS0EBCL3AueLQ9vH7l1kIxH1N+ES5mOTtaUrjahe1jCYgxlZYmOCz
         Zfv9soa+qvqz5w7Y2jxcauOCDB6zCChGdATn6YivnqTmtG/4hPM7fo87VuBsFV0W6/5j
         72AoYQ02iSoQroXCm/o7Ox62tFRrL9JFbQy2zDMXfD3soHE0xkp1cpp0Z8TU4bMPu+3X
         Sv+A==
X-Gm-Message-State: AOAM533zUrim+voFl0B4XzCThkRu08CHoV1vDWdWZyOKM9O5Z9CMrnVF
	qoHWqnmkXebwh8BCrn5vOso7x2rAS+Bi5w==
X-Google-Smtp-Source: 
 ABdhPJwXiuk08aZfpQD7+Zzq+cA+2n979qdQuyybYg76QOR5u9h9KK3h10BGyjRQ8oO4G3espGEaxA==
X-Received: by 2002:a17:902:b092:b0:156:a40f:f716 with SMTP id
 p18-20020a170902b09200b00156a40ff716mr9997012plr.72.1650729556121;
        Sat, 23 Apr 2022 08:59:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 d15-20020a630e0f000000b003a408836badsm5132110pgl.45.2022.04.23.08.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 08:59:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] wlconf: Use nonarch_base_libdir instead of hardcoding /lib
Date: Sat, 23 Apr 2022 08:59:11 -0700
Message-Id: <20220423155911.1651860-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14618

Helps with usrmerge builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
index 477c5a96..a6f62239 100644
--- a/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wlconf/wlconf_8.7.3.bb
@@ -14,14 +14,14 @@ do_install() {
 	install -d ${D}${sbindir}
 	install -d ${D}${sbindir}/wlconf/
 	install -d ${D}${sbindir}/wlconf/official_inis
-	install -d ${D}/lib/firmware/ti-connectivity
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-connectivity
 
 	install -m 0755 wlconf ${D}${sbindir}/wlconf/
 	install -m 0755 dictionary.txt ${D}${sbindir}/wlconf/
 	install -m 0755 struct.bin ${D}${sbindir}/wlconf/
 	install -m 0755 default.conf ${D}${sbindir}/wlconf/
 	install -m 0755 wl18xx-conf-default.bin ${D}${sbindir}/wlconf/
-	install -m 0755 wl18xx-conf-default.bin ${D}/lib/firmware/ti-connectivity/wl18xx-conf.bin
+	install -m 0755 wl18xx-conf-default.bin ${D}${nonarch_base_libdir}/firmware/ti-connectivity/wl18xx-conf.bin
 	install -m 0755 README ${D}${sbindir}/wlconf/
 	install -m 0755 example.conf ${D}${sbindir}/wlconf/
 	install -m 0755 example.ini ${D}${sbindir}/wlconf/
@@ -33,7 +33,7 @@ do_install() {
 FILES:${PN} += " \
 	${sbindir}/wlconf \
 	${sbindir}/wlconf/official_inis \
-	/lib/firmware/ti-connectivity/wl18xx-conf.bin \
+	${nonarch_base_libdir}/firmware/ti-connectivity/wl18xx-conf.bin \
 "
 
 FILES:${PN}-dbg += "${sbindir}/wlconf/.debug"
-- 
2.36.0


