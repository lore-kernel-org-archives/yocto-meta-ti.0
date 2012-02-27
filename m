Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AADCE013A5
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:43:29 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so3290771wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:43:28 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.131.210 as permitted sender)
	client-ip=10.216.131.210; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.131.210 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.131.210])
	by 10.216.131.210 with SMTP id m60mr7026581wei.47.1330350208562
	(num_hops = 1); Mon, 27 Feb 2012 05:43:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=CDRLfgGeex/p+bmc55fj8CM0lqfM0al0sBn68f+1io4=;
	b=cFN/EtCLhst9A9HiKpR71+iqIm/sj29RnHs0cg9Bs5Jvfro0vNDWb7Tnf/togi+mqb
	eT8hodr/HD/xF8KowZ7h8KN8x3HRZFCzvXE12eFlM2qzgPasluFsgFi119JNzAOuGOkm
	igdHmf7vPPHxtUkEjNRMTfRIv4z4XrVAt9kqk=
MIME-Version: 1.0
Received: by 10.216.131.210 with SMTP id m60mr5586384wei.47.1330350048172;
	Mon, 27 Feb 2012 05:40:48 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bg3sm21974903wib.10.2012.02.27.05.40.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:40:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 27 Feb 2012 14:40:24 +0100
Message-Id: <1330350029-29100-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
References: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm4RaYCaVd8m7fgIKg0d22OXlEchBN5mGUW3Q7NeS6Z019DdTIIvLMYMoY7O+kk8DIqWiBH
Subject: [BeagleBone][PATCH v3 06/11] beaglebone-tester: include Jasons debug tweaks
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2012 13:43:29 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index dae9628..7a72547 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "0a3415705afb206694d4e873fe8228b7440213db"
+SRCREV = "dc89e2d6b2ac0238a7aa5a334d7c86d7b8613837"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.2.5


