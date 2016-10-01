Return-Path: <vomegaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 241A6E00D89; Sat,  1 Oct 2016 05:43:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.65 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.65 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93E1EE00D64
	for <meta-ti@yoctoproject.org>; Sat,  1 Oct 2016 05:42:56 -0700 (PDT)
Received: by mail-wm0-f65.google.com with SMTP id b184so7172847wma.3
	for <meta-ti@yoctoproject.org>; Sat, 01 Oct 2016 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VlvPyRH/BsDVvbbPEFY7ASOot2OdXDB47kSH48o+a2U=;
	b=jfbJ/2xvllP5lyy3TVzV86Y7qNQcBkaYKeqCtpy0UP7mB/N7zGFLqa1dmABZPAHN96
	AM8kj1sFuZpAUxMAWz1nPpTC0nqBeMTUs0LcG4eOqr9ZreLZVFd3P39fv/q1r4sHJ3yO
	wxfUAKZiptWG/rVgjsEyU0Z2tgtOmW7tS7syUHZN5fhzssuhkcBSSi+IOj2CGI1XLfvT
	3y6PnRz6ojcPjsgapISiSrIXp4RzvxMSSzoDM4GVZpKD5J4XHIZgImrQ4oLKmbxMq6AM
	3XeSQefwTvADAKyAKaGw3OIYXGlMJGMjYKMgVcRwf87I+cuh65CQpyoEjkUKgnze7nNe
	5Kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=VlvPyRH/BsDVvbbPEFY7ASOot2OdXDB47kSH48o+a2U=;
	b=gPGSXo8141Nz6/j+w1o6HZhtILMNYg6AFe/xdI97OwrqPttnMK1I/fBQUQy1VdaC1f
	fdONq5xhYtlg65Vs2UzH+zCfkRhiNMGR0WrNOeId8d88KOEAu5AqhtVRJ+78i3zEy5jw
	zoQ2Rb48iR40n68nWL1xURpaFnvEv3AI0px8n9P2lcVjPysqptznFRTcUzWEaYyanLTH
	HFVDT8yQNV9VlTcj/EWeB2zyV46kE4GtOK/BhIKQyBHD19zxtITvC0Umg2+mQtWy217D
	aD+EFK6kVHBt5Xi2BMHgo4S/5ni19AyZ4zhw5JMKd321+35Qf0XohFfcHm2EPWYWbgJj
	mz7Q==
X-Gm-Message-State: AA6/9RmFD6yGXI1y1OtktB3S7rL+d8MDfbX0/IDPbomlbhhSZlvU7qOwI80hdN0wNYaWOA==
X-Received: by 10.28.111.152 with SMTP id c24mr2324958wmi.62.1475325775165;
	Sat, 01 Oct 2016 05:42:55 -0700 (PDT)
Received: from sgxcmp483.sigfox.com (ram31-1-82-234-79-177.fbx.proxad.net.
	[82.234.79.177]) by smtp.gmail.com with ESMTPSA id
	w203sm9018353wmw.7.2016.10.01.05.42.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Oct 2016 05:42:54 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: meta-ti@yoctoproject.org
Date: Sat,  1 Oct 2016 14:42:37 +0200
Message-Id: <20161001124237.15032-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] Fix Python3 build issues
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
X-List-Received-Date: Sat, 01 Oct 2016 12:43:00 -0000

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 recipes-ti/includes/ti-unpack.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/includes/ti-unpack.inc b/recipes-ti/includes/ti-unpack.inc
index 9101044..481e598 100644
--- a/recipes-ti/includes/ti-unpack.inc
+++ b/recipes-ti/includes/ti-unpack.inc
@@ -48,7 +48,7 @@ python ti_bin_do_unpack() {
     cmd_list = cmd_string.split( ":" )
 
     # Make the InstallJammer binary executable so we can run it
-    os.chmod(binfile, 0755)
+    os.chmod(binfile, 0o755)
 
     # Run the InstallJammer binary and accept the EULA
     filename = "HOME=%s ./%s %s" % (workdir, binfile, arg_string)
@@ -74,7 +74,7 @@ python ti_bin_do_unpack() {
         tarfile  = bb.data.expand(tarfile, localdata)
         tcmd = 'tar x --no-same-owner -f %s -C %s' % (tarfile, workdir)
         if os.system(tcmd) != 0:
-            print "ERROR: ti-eula-unpack: failed to extract tarfile"
+            print("ERROR: ti-eula-unpack: failed to extract tarfile")
             raise bb.build.FuncFailed()
 
     # Return to the previous directory
-- 
2.9.3


