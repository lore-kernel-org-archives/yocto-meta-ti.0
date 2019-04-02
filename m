Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A65FE00AB0; Mon,  1 Apr 2019 19:23:25 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.214.181 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
	[209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EC57E00A84
	for <meta-ti@yoctoproject.org>; Mon,  1 Apr 2019 19:23:24 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id y6so5450635plt.1
	for <meta-ti@yoctoproject.org>; Mon, 01 Apr 2019 19:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tBMvXj3UkQ8MKoWH7VW/9Omjg3+b6Pvs3gl7muB5Kpo=;
	b=LIrAneAIxGNV0vgzGbKuF5U9HdygURL6cJ5q9nGliHlizEIkRoayGxnHldGm9rSnNv
	Gx8KDqx26ZZDJbqzccylvWbprT6px8xalJv1SND9RP2ExEJ/adZGh9Ouv7HSGT5mPyYw
	by+XkKSvTh6Urijbvnk9rJp2/XnQIgiwZqcLXLukTZOMuLKQfoED6eCAL/pNDzt0gxm6
	/FP91j8VFaBb0kT/oQs3vmeDuQ5HS3lM7G/0QuXiS8Lu6vYXiMF10tPVIseQv9LfAjcr
	njLoSEsXlaB+RBdatVJcw2WlmKGTNwNXMI/ovmkINLIN6++gRSB312r5rCyu8JQyVa1P
	xW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tBMvXj3UkQ8MKoWH7VW/9Omjg3+b6Pvs3gl7muB5Kpo=;
	b=YdyagD7gxvoPvFK4L81uqJiRFsjgx8ec3hcxYQZJeN2P7Jz0Iqdg25K3CpL4hM5pYJ
	GKp/TQwGPl3WLgTvxQF4DTEwAdPGY0Nquc7twEn5RGEWlXggeQrBCw2EVeqpqTl4Tf5+
	qdjsZNzfE/+fukviJefixuPsr2Uo3F3oazbpntDgzlkf7OYFP5Mbfdy+g39rfCHy+gta
	wD/MpMdMg2VeOMld7qI8ZWrATQhsGs8DF+ULTh6GTct2633GusBJGIO0Xy6San2gDQ8X
	cHCNmds2psgcVDUip6Z/6c5aa9JMvi+nTTHh66kdp9m5TbponE6JPsB3NrtQOx9Maqkl
	1lfQ==
X-Gm-Message-State: APjAAAW3I1A96EqiiB78PW+NUO61kq3+sMjxLVX9rHs/7xiPOs/OGvTG
	f2tG7rc4Ih5EX9BIsFjdojHnrvO8HQo=
X-Google-Smtp-Source: APXvYqxqPuIezRaWO9BSBwAJuDkJYul7ruRK938xnr0MqdOQVQ0GFebP8aJXQYNwmH/Dhrw+Ua+OWw==
X-Received: by 2002:a17:902:9a98:: with SMTP id
	w24mr66881421plp.247.1554171803640; 
	Mon, 01 Apr 2019 19:23:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::7644])
	by smtp.gmail.com with ESMTPSA id
	c17sm16031598pfd.76.2019.04.01.19.23.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 19:23:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  1 Apr 2019 19:23:14 -0700
Message-Id: <20190402022314.43905-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] layer.conf: Add warrior to compatible release series
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
X-List-Received-Date: Tue, 02 Apr 2019 02:23:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 824443d4..f6b6bf70 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "sumo thud"
+LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.21.0


