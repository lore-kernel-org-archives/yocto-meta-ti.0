Return-Path: <colin.bester@biocharger.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D65ADE00D88; Sun, 17 Nov 2019 06:56:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.171 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68841E00D47
	for <meta-ti@yoctoproject.org>; Sun, 17 Nov 2019 06:56:04 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id o12so2847802oic.9
	for <meta-ti@yoctoproject.org>; Sun, 17 Nov 2019 06:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=biocharger.com; s=google;
	h=from:content-transfer-encoding:mime-version:subject:message-id:date
	:to; bh=D0mbYnO0o25An0VXMZpDJRFY1QrH/TorrTmWm3I8DuA=;
	b=BnUq/Okt0iK6yc5MsLtUKs6VAaZjzCEam6qRLKiPrrGs5X1+1LdThnMvxtJ3FXVKr9
	lokiJAZEFIVsKExJi2bZuUshy9D92G7l81mE11uZNFp9I9tHg7/YbuCyBTxoT5M7DTob
	MHyPU/Ig/xTJIAok8SSgnHzXhLGfuGaJCU8RS3x6dvNZ+/BIw2BU6/U0QgeakhWYM7OH
	3xGVAOxglbse9G87RZNW4ZHkxD1WlJvWWF70D/2pjDZ0UkU+SS8ZWAywFtKhoIpTh/jd
	vLaEusXpuLsp218/UiZU0M8lcKTbEd7tX2c13ljgZU3C4MFuAdJxAOIhxSNNwvkAPWRe
	Bq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=D0mbYnO0o25An0VXMZpDJRFY1QrH/TorrTmWm3I8DuA=;
	b=s7bIHSOeafOr8PadAggT6SHMJ7JArV2z0H1JVf7rBKo5D71P3OYqKDsngZqwt4arFj
	58me7eOt7JvXtyDe3kHIdxB91ZVbXh16fo+lrRyraF+Vae9VbFhJqfmVaHohVtuGx6mw
	eK9QRia91I+WCWakwitp/Tmb5koq2GmaXQ/6PIuSkne+Q77Vt0UYKF88xOwe84M7PlyD
	iALTCyDHD9LWobpHWOXln4SGaLExSv7RUmrTQfT/0F3BdZ8G4Ab8qHeMmAsH0NdiCLx7
	9HvwyogZ7FfNSc3xZIUfs4vExy+y+gCfbirO3uXZqvfb6ILW6wWYh6+Bn783bmq+DK1q
	6yFQ==
X-Gm-Message-State: APjAAAV7cgD9ByJbcFyjeaXw2Td7RsLuFe1cAv/pvOJeyqsQUZodwwEn
	p+WsuDgqx6Qdv9uaFXpWBRml88eos0cA0g==
X-Google-Smtp-Source: APXvYqxAuFMTkyUxmaCCquLRz9uPRKESDzqT4BRYnx9YNq+S5OWucV7PbhNAbFUS+WLXHwzm1sOVNQ==
X-Received: by 2002:a05:6808:88:: with SMTP id
	s8mr15540304oic.109.1574002563347; 
	Sun, 17 Nov 2019 06:56:03 -0800 (PST)
Received: from [192.168.1.69] ([209.94.253.133])
	by smtp.gmail.com with ESMTPSA id
	a23sm4937573oia.41.2019.11.17.06.56.01 for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2019 06:56:02 -0800 (PST)
From: Colin Bester <colin.bester@biocharger.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <5B61D358-0332-46AF-B815-C49CBD1433C5@biocharger.com>
Date: Sun, 17 Nov 2019 08:56:00 -0600
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.3445.104.11)
Subject: Equivalence to shipped BBB
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
X-List-Received-Date: Sun, 17 Nov 2019 14:56:04 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Can one create BBB image as is currently shipped today using yocto and =
meta-ti or is additional building/installation required after creation =
of image via yocto?


Internet Disclaimer
_________________

This message (including any attachments) contains confidential =
information intended for a specific individual and purpose, and may be =
protected by law.=20
If you are not the intended recipient, you should delete this message =
and are hereby notified that any disclosure, copying, or distribution of =
this message, or the taking of any action based on it, is strictly =
prohibited.
_________________




