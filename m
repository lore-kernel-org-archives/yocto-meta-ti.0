Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web09.1160.1577994063126822168
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jan 2020 11:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20150623.gappssmtp.com header.s=20150623 header.b=rxo+Om+V;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.193, mailfrom: troth@openavr.org)
Received: by mail-il1-f193.google.com with SMTP id f10so34888472ils.8
        for <meta-ti@lists.yoctoproject.org>; Thu, 02 Jan 2020 11:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=M8Uo2G+3e8fHH5HIz8/kHQ81zdB+39cnVJhJu7rSECQ=;
        b=rxo+Om+VDNibNawi59lrIcFv+CwzOGKmPM8svr4dqItWN4zOPBk6zoNt0pdDs9QGqI
         JvgQtAJuJx/ryC8sHcMBrX5ipcRDb/T2Ay31aO8wy+Io7e9MtNtIvv+F9k5whrIRPjb6
         pZ8VxqwE5qKzDElmLgnNxdaZb4/DarYudylL0XrLHowcdSTvhXMZmwrkgGWEvC9geAAf
         Fa3WjxiH4zKpwCJaeSU9byIt2Sr7N55ZOtZgaFLZh+NhL5iz6q/4B1J/bz0mmnS/ZQCw
         VshGRxTujTSCxXOZSn2N70GemZMsfVh6VLAtCQA4ejRM+zBu5iVD+tQbEGpb0o62XFCY
         8/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=M8Uo2G+3e8fHH5HIz8/kHQ81zdB+39cnVJhJu7rSECQ=;
        b=fns4qX45hOcnHSCVOBimV3vDhCETrWkxPuSS+GV2U+ZdLaAVZ78xocxSBIc8lOFYnB
         l41EuyUQr3mgCYccq0lyK5KtdyLOnz+NPj/+qnm2LkXlGC5NTWI0rMOwID4pjb2d2AzQ
         0Ydrskl7YElWBqhGTu1QtXshv6TWK3YQ51IJWf+sVaU6SniI2+xPegk0nl5/pv+0ZQCx
         xoas+cULzr8yeutR2CnIndLk7rCUleZjTAd8DBNl2EPYFZeCCblPdf0fxt7mxpGbaWFq
         A2cI6ocxfw4txsptHsctSNk5lycWCzBfZvC5Vz5t5lCYJoFBmsh4ZjtZggYv92APko7Y
         QXRQ==
X-Gm-Message-State: APjAAAWCswdCEOGQLJVyofQb/Iwy9jo3bVZhDtJwaLj1Gjtrzo/puLB0
	gHWfV2h2jl99lIXar8WarHXN5eKz+2Y=
X-Google-Smtp-Source: APXvYqyAzlDRAosHeUg08+orGo9NgVTXtWHncDXFyzGtQtYf558tw9VhNJBUWZJsTqF4Ub/pyyzefQ==
X-Received: by 2002:a92:ccd0:: with SMTP id u16mr66613028ilq.215.1577994062181;
        Thu, 02 Jan 2020 11:41:02 -0800 (PST)
Return-Path: <troth@openavr.org>
Received: from beast (c-73-243-79-134.hsd1.co.comcast.net. [73.243.79.134])
        by smtp.gmail.com with ESMTPSA id m90sm16194270ilh.56.2020.01.02.11.41.01
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2020 11:41:01 -0800 (PST)
Date: Thu, 2 Jan 2020 12:40:59 -0700
From: "Theodore A. Roth" <troth@openavr.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH] beagle-x15: add am5729-beagleboneai.dtb
Message-ID: <20200102194059.GA13220@beast>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Theodore A. Roth <troth@openavr.org>
---
 conf/machine/beagle-x15.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
index d5e05ec7..0af45a84 100644
--- a/conf/machine/beagle-x15.conf
+++ b/conf/machine/beagle-x15.conf
@@ -4,7 +4,10 @@
 
 require conf/machine/include/dra7xx.inc
 
-KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb"
+KERNEL_DEVICETREE = " \
+    am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb am57xx-beagle-x15-revc.dtb \
+    am5729-beagleboneai.dtb \
+"
 
 MACHINE_GUI_CLASS = "bigscreen"
 
-- 
2.17.1

