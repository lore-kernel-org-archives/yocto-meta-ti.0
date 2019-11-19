Return-Path: <colin.bester@biocharger.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08895E00E0D; Tue, 19 Nov 2019 12:47:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.195 listed in list.dnswl.org]
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BF61E00DAE
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2019 12:47:12 -0800 (PST)
Received: by mail-oi1-f195.google.com with SMTP id l202so20353112oig.1
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2019 12:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=biocharger.com; s=google;
	h=content-transfer-encoding:from:mime-version:subject:date:message-id
	:references:cc:in-reply-to:to;
	bh=x1UPJdGRnnhIB65wiDXkTF0o45sl45g2p2wxl0CAhPg=;
	b=mnL3ZR7iuy/sOJxxHSc3N2I/A2gMS7KkVUZgUgNhQLg0PWDLhGOiFneMQ5nHQiAcYT
	68qapHTpoI66ZyKI/uPibWPAmj434TyQSmd4vC8r67PeJcP8NQPobrEvxZJfIlh3p2mK
	E1y6unFCuDS7GKgKD7ccpvTmfPQauIgpBcJVfODdthwtle6ytsNQzeaTaJfX9X9DX8J1
	JvuJvV+6wqU1reFt255EI+DG6AHCXQ2cwL/EKje4/MXN3r9q9WWwK+ULH5Bjsb/rnOje
	ThqRD82kWEE9VoMG1R6PvYaGKGbop6e012FXGA0+oneBxYvpqiVU9y2r7LgYpXxuYbxC
	LCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=x1UPJdGRnnhIB65wiDXkTF0o45sl45g2p2wxl0CAhPg=;
	b=rLx31SjtUDgfaKHygpruOdbQQCBa13IAWVp2Ej4xm9scKe+luc8Y+2iPsvlOYXUTRh
	etls2jhfrqFybUkFHKiN0X+aRFNo8aqopg5cuYoDVNGhTnDqgF0Cx0qQ14/6vpnkuFFw
	PA0oIWaAStp1902rxvqIfA1eglzWWV3vKcOxcH/+HZQIEHOOklubuMveZ/cyPDjNzyaS
	Lkp9kgvQO8hZhfxIOE5HCMG/KNMmWH4M9QFYlv81/wr53SekMCGys6xnKP8zh2B4K70V
	uRLKUPu4xRiHG07w+tCcy7NZmQuON8p1Ry/+oBGZCMm/tR6mMDQqF5cLXPZbbFJVEpVR
	Boyw==
X-Gm-Message-State: APjAAAWY/B+zR6H9RqTuJZubphjZsvWKHOaRD4tPIsO5napKF8+LnOwZ
	hDGW09KndCrzWmPIIh40tGmJ/g==
X-Google-Smtp-Source: APXvYqxFPaMuuTrHmOu1NY0Nw01SLlhHMPutefQGCTogAmYXG9ZeiF8c5q/VJROvnYejldpEUxxCqg==
X-Received: by 2002:aca:fd47:: with SMTP id b68mr5631931oii.20.1574196431716; 
	Tue, 19 Nov 2019 12:47:11 -0800 (PST)
Received: from [10.117.72.86] (mobile-166-176-122-164.mycingular.net.
	[166.176.122.164])
	by smtp.gmail.com with ESMTPSA id w10sm7693638oif.9.2019.11.19.12.47.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Nov 2019 12:47:11 -0800 (PST)
From: Colin Bester <colin.bester@biocharger.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 19 Nov 2019 15:47:09 -0500
Message-Id: <AC0A7D9E-D1BE-47BD-851B-25924327068A@biocharger.com>
References: <20191119182501.GG27719@beryl>
In-Reply-To: <20191119182501.GG27719@beryl>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: iPhone Mail (17B102)
Cc: meta-ti@yoctoproject.org
Subject: Re: Equivalence to shipped BBB
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
X-List-Received-Date: Tue, 19 Nov 2019 20:47:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yes for Debian as is currently shipped when purchased  online. I see capes =
etc seem to be an issue.=20
> On Nov 19, 2019, at 1:25 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>=20
> =EF=BB=BFOn Sun, Nov 17, 2019 at 08:56:00AM -0600, Colin Bester wrote:
>> Can one create BBB image as is currently shipped today using yocto and=
=20
>> meta-ti or is additional building/installation required after creation =
of=20
>> image via yocto?
>=20
> And by "shipped BBB" do you mean Debian images? If so, it should be poss=
ible=20
> to reproduce them in Yocto, but currently there are no ready-made recipe=
s=20
> available for those images.
>=20
> --=20
> Denys

