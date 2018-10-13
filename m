Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DBC0E00B9F; Fri, 12 Oct 2018 18:57:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.195 listed in list.dnswl.org]
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 058E5E00B92
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 18:57:29 -0700 (PDT)
Received: by mail-pg1-f195.google.com with SMTP id f18-v6so6631868pgv.3
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 18:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zMXKgYd11M4CcynRoS1fV5vnv1VlkSBum7e9RkGVEfE=;
	b=D9QFUNryC8CxiCwIeqIzQ1gwt/FuZdBx3n9fQKhLsIlknbD+mkMrTWtSqfC/jXyPQ5
	5mR3o7uZ+KfJ6gaGsYYXnzmYtfRe1QAlni8srlSPilmxpGUpyXHMvsi+5i0LYbpZeSXO
	ab21iLKgQA2tWwRex/1Ecga8dMoY0PYr+s07CKgBxFjYAe67Xh2maI/K3Lbid67mO/pw
	WgoQoK5SYZ2ZOo2su8v/BzhGH3hVi+EsaJIDrgW+OOEY/qvC+sigBC3VjT6PRftYVEpn
	tG2nQv75dOcFTub1NqMvfUfEfX2TPclxKi1fKUU8/oC8jvbcKdQSOlo+ouCzDodgoZg3
	M8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zMXKgYd11M4CcynRoS1fV5vnv1VlkSBum7e9RkGVEfE=;
	b=ftPyb2hFqGgUQuNu4d98sq4E1hIeIN1pyTAplOihB+r/qvjEu1KD9qlSQotjVFdbCx
	cnoOeAtssh9xBDKMcoGMgf3VoT33PYJGE5fyXR/IQJKlrlkuQgy4Asr5mQQMG3q09wl/
	7ZfoOGAscStdhPSglc3XbS9/xi2L8E/ooiWxawKeWWf9FENGJlMKOWvZsozVlVi2JSBs
	p8/agmQ/KnZ9mfCuLxDdV4w/83Vt6nvd8ficRqNpd4vqeeySWhsmCpwrnSN4BHrun2do
	gfsG/qKeAsblJ0vToyY9OeLNXzqFJUkHopqBZsX6dPx1JMLr7Kj5tT25GhL4X/B79icv
	W/Aw==
X-Gm-Message-State: ABuFfoh72z8bPK40HEoxt+KwyE2TsocNqZgxveB0vaX7bkG3sjDomEdd
	OMXh75Wh3W4zTus6AoJlvpGh1pbg
X-Google-Smtp-Source: ACcGV60dXOuG8K4xZev474A5j/ykTccB/Du8EKzsEpv6kTHrKird3vp1Qhfk3vY0XjyAZxQxNDr7yw==
X-Received: by 2002:a62:5f05:: with SMTP id
	t5-v6mr8468852pfb.223.1539395848902; 
	Fri, 12 Oct 2018 18:57:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	i5-v6sm3456319pfo.107.2018.10.12.18.57.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 18:57:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2018 18:57:20 -0700
Message-Id: <20181013015721.33162-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/2] beaglebone.wks: Add beaglebone wic template
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
X-List-Received-Date: Sat, 13 Oct 2018 01:57:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 wic/beaglebone.wks | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 wic/beaglebone.wks

diff --git a/wic/beaglebone.wks b/wic/beaglebone.wks
new file mode 100644
index 00000000..b75f238d
--- /dev/null
+++ b/wic/beaglebone.wks
@@ -0,0 +1,6 @@
+# short-description: Create SD card image for Beaglebone
+# long-description: Creates a partitioned SD card image for Beaglebone.
+# Boot files are located in the first vfat partition.
+
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16 --sourceparams="loader=u-boot" --use-uuid
+part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4 --use-uuid
-- 
2.19.1


