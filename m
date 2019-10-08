Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94A99E00C25; Tue,  8 Oct 2019 15:45:19 -0700 (PDT)
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
	*      [209.85.214.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C110E00782
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2019 15:45:18 -0700 (PDT)
Received: by mail-pl1-f195.google.com with SMTP id d22so72717pls.0
	for <meta-ti@yoctoproject.org>; Tue, 08 Oct 2019 15:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Oi/J/TNqRSBFWFpJ51AA9NF5v3wLGV8Gb+sYrbagENw=;
	b=JykPtHBvz2OfabL7LcAaHV8jygXK9w5htd5TiWv6QbtRdeTaY7Hy0bNOgRGO9ZrfWG
	1O3CJuBm8u0MSe0I9FvVjhEYwghgXCLV+cRLqFfHBfCO77riRUfBT7tcPeHrACkEry+d
	MdlLbf5t2aPcpr6nuxSWm4k48dr606+WYm3OBMBfRjWlKlCxM0wAxA991SEx9mlUzTD7
	nUqoMfBsuJsPulrlNdImch8Qxcuj7Z3zHcVrwjIx6f3/fOKRjmA/20Xki4gZRcJUS3/2
	KVE3yvUaYHIldKakQ1KMsflpyKfpqJ0zjZVT/E/qm85b99sVXsHsSGjDfDBRR1skzpcy
	f+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Oi/J/TNqRSBFWFpJ51AA9NF5v3wLGV8Gb+sYrbagENw=;
	b=KFDX16ACwAaY6snyrSIeHoV6APRZp0RpeTlKW3Am52CgcJ7yGUZBoWY7oEYXLTvO9v
	MTw4RYhYqYREHD6pgTL3Uh/gXETTEhCfb+IIIpoLMF43gpC6auvI5cZeDCWvhUlLMkQW
	cDujgckck6z4bJ4v8zm2Q622hZSTjKxcUgDSiL1b8r9L7TuWHQpbU9HYsNh/nxEuiv4S
	8XVdZ732Z0FvT3sW6jycO3osa2kSGX8s3CVVnHEIgycQAg348DuojtH/jkZZgkCAnXis
	8qPfKlhDfHiomWd/0dCUD2B1H+r5hN1Y+uaImsAex9uDMVrO7Pn9AbwZquRuSrQyHX7t
	GtbA==
X-Gm-Message-State: APjAAAX6Us0XazdEbAANxsszvaVqr4SZuKFgahMx2Eb7odv2fofdwRMr
	WmkjpDJVD5MEkmDy+cgzvUAi3uHMD0I=
X-Google-Smtp-Source: APXvYqyg1MnpqUSbMg8BC1wDm5DvJE+jlpiQEL/sb3Fd5bTv2l4aY6OBlx92Fs/RU5OrcrNFsNXSHQ==
X-Received: by 2002:a17:902:8bca:: with SMTP id
	r10mr37872023plo.233.1570574717875; 
	Tue, 08 Oct 2019 15:45:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id l6sm204968pje.28.2019.10.08.15.45.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 15:45:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue,  8 Oct 2019 15:45:09 -0700
Message-Id: <20191008224509.564800-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] layer.conf: Mark compatible with zeus release
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
X-List-Received-Date: Tue, 08 Oct 2019 22:45:19 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index f6b6bf70..f6e090d8 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-ti"
 BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti = "6"
 
-LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior"
+LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.23.0


