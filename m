Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBB1EE0071C; Tue, 25 Oct 2016 11:36:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.195 listed in list.dnswl.org]
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B109E006D8
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 11:36:08 -0700 (PDT)
Received: by mail-pf0-f195.google.com with SMTP id s8so20313750pfj.2
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=j3CwFhLEqOyl4GOyNZWPF0k1oiEFZf4Y4WuxMblKx6E=;
	b=Y0QwqVrjgUKlC4CximiXuDuylmA6oSDpbKpoUz1PjYjh5maj2dyMqTCl6k3zZWa+LQ
	sJjoSqfFCcn8930FjjVrMp+QTmTsAM5S3BbgMQXl7hTTsZWWwdB6dTDSRktp3xD5aXiM
	Iort8kfj826Uc5NrVZsNeGufCns5R7wQRLUBTfvtKjk1i8wQRzIN4ho2yb1SVXso5B8E
	T9IEbKvBoPsq4HxNdc+X7cP7eEgXkPQ3fllTKgaWrgOa8105ZvVOjuABYARL3lNuyxo9
	zDOhWJOkkRo6hDK8jYGPRPu1KJx+gCeCrZF9nkKtUs1wgXpIEdZ3gILMffM3cWVVoB+F
	zxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j3CwFhLEqOyl4GOyNZWPF0k1oiEFZf4Y4WuxMblKx6E=;
	b=ZZYuOkpjHfUU/NcWv1Ic3rCpNQJgmuZYAyRQzNgnVSDlQojTiSncrn+IxFJIfdHOYJ
	7gi8CPeQ4e8oC4WGoFIt9Kr8I4SyzNJSsrluCt7YtWg19QWM1sMEPMcP4y6D9aeUtMSt
	85F+ilowfoinG8tBVQ6ZThTHar13HNyh3vYuA1vX3o9/xzGh1blWtHi36fXRZ+05oKdi
	42Q2tlMbyZTg4ZJ69nO2z3UonhrJpW2yg9PGd8DxZ19Ut6SsX3xmdCkaZbK++bp8gLi4
	f26fDA9Ow+d866D4S8o5kfW6I/39CIETLPLTi7mYdOfqBqqDCnEHdsDp5NifOy/puGBw
	HceA==
X-Gm-Message-State: ABUngvfFoq1WtIzaNdm30xarkrT+Ta09kXsRSnpRK3HOgJg4jVKJp2VGS6vnkyz189HLIg==
X-Received: by 10.98.68.218 with SMTP id m87mr42233377pfi.20.1477420567404;
	Tue, 25 Oct 2016 11:36:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	t7sm35113492pfa.22.2016.10.25.11.36.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Oct 2016 11:36:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 25 Oct 2016 11:36:00 -0700
Message-Id: <20161025183600.22287-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] uim: Fix build breaks when toolchain is used from sstate
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
X-List-Received-Date: Tue, 25 Oct 2016 18:36:15 -0000

CC is being redefined here but its not considering
the essential options to specify the sysroot as a result
this breaks on systems tied to sstate servers where the toolchain
might have had a different sysroot when built, in here
it fails to find the standard headers due to missing sysroot
options.

Deleting the extra oeconf works fine.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-connectivity/uim/uim_8.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-connectivity/uim/uim_8.5.bb b/recipes-connectivity/uim/uim_8.5.bb
index ac9dc51..72e2166 100644
--- a/recipes-connectivity/uim/uim_8.5.bb
+++ b/recipes-connectivity/uim/uim_8.5.bb
@@ -12,8 +12,6 @@ SRC_URI = "git://git.ti.com/ti-bt/uim.git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
-
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 uim ${D}${bindir}
-- 
2.10.1


