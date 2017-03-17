Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2688E00ACD; Fri, 17 Mar 2017 11:38:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.48 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4408AE00A4F
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 11:38:12 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id j90so36655180lfk.2
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 11:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ydcArfN+zySh2YQnsY4MWo/2ovS2ZKeUNcZzjjePIXQ=;
	b=KakTM/mBLsBd3z6Kv+ppBjrXEFds/ksr1bXUDMtH3gmHrha4fBGbUPlDW522kvCzPK
	FBRcoP17/XpwWoWHtvoYBDiENnHw6LlWiWAV2qJot07mDFHULgO9YInhmkh2v/bK/tVW
	A1fqOWaznkpTp0wheLHJ0vRb1KKq4CE7bOWyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ydcArfN+zySh2YQnsY4MWo/2ovS2ZKeUNcZzjjePIXQ=;
	b=TBGPULhmrrSDfI+MOpdqphIb0Zkxpa2PkyX4TFy4obv4VQ9jrm9tl0jg1kQITYXz0V
	hgmcioybVaQuEYh17dNwC4FSqGP3dKioeIsUmlg8mMlMqtTX2tFPEc4CeJWpPgyD5+EG
	DBghG3dUQnpWCes7IRulc51bDiN2sLbgRn8IFMvzuHCLbnqYdmQpEGstYaJAKNWG59IR
	85/VKZv/bYf83ur5j5/j9f9CoSzVZjlqgah2XWpdszIYRLkmdIvcC9XLQHYTOJJwZ7yH
	l6VI/l1gufE9bhOY77DTPYaKg6GMwWNX0V4DfD52MOgQdEbKqqfSggZzYJVNUcNGQflK
	HZpQ==
X-Gm-Message-State: AFeK/H2d8mFLq8oScystPgPKziSoO/2CVBdmiQQJB5F+xVnjqypNKZQ0Q4jxTsK6BltkNPr2
X-Received: by 10.25.18.225 with SMTP id 94mr4741517lfs.131.1489775892101;
	Fri, 17 Mar 2017 11:38:12 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id 9sm1630839ljn.1.2017.03.17.11.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Mar 2017 11:38:11 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: meta-ti@yoctoproject.org
Date: Fri, 17 Mar 2017 20:38:09 +0200
Message-Id: <20170317183809.942-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Subject: [morty-next][PATCH] kselftests: add bash/ncurses runtime dependency for futex test
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
X-List-Received-Date: Fri, 17 Mar 2017 18:38:25 -0000

futex test requires tput at runtime.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 recipes-kernel/kselftests/kselftests_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb b/recipes-kernel/kselftests/kselftests_4.9.bb
index 3cd12ea6..6e8c2143 100644
--- a/recipes-kernel/kselftests/kselftests_4.9.bb
+++ b/recipes-kernel/kselftests/kselftests_4.9.bb
@@ -142,6 +142,7 @@ FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
 
 RDEPENDS_${PN}-cpu-hotplug += "bash"
 RDEPENDS_${PN}-efivarfs += "bash"
+RDEPENDS_${PN}-futex += "bash ncurses"
 RDEPENDS_${PN}-memory-hotplug += "bash"
 RDEPENDS_${PN}-net += "bash"
 RDEPENDS_${PN}-vm += "bash"
-- 
2.11.0


