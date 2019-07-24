Return-Path: <andy.pont@sdcsystems.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF27CE00E0E; Wed, 24 Jul 2019 13:54:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [216.40.44.97 listed in list.dnswl.org]
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
Received: from smtprelay.hostedemail.com (smtprelay0097.hostedemail.com
	[216.40.44.97])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFFEDE00DF7
	for <meta-ti@yoctoproject.org>; Wed, 24 Jul 2019 13:54:55 -0700 (PDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5865618029152;
	Wed, 24 Jul 2019 20:54:54 +0000 (UTC)
X-Session-Marker: 616E64792E706F6E744073646373797374656D732E636F6D
X-HE-Tag: hair07_64e4952d3c43b
X-Filterd-Recvd-Size: 1465
Received: from [192.168.10.100] (unknown [5.133.40.160])
	(Authenticated sender: andy.pont@sdcsystems.com)
	by omf03.hostedemail.com (Postfix) with ESMTPA;
	Wed, 24 Jul 2019 20:54:53 +0000 (UTC)
From: "Andy Pont" <andy.pont@sdcsystems.com>
To: "Denys Dmytriyenko" <denys@ti.com>
Date: Wed, 24 Jul 2019 20:54:50 +0000
Message-Id: <embda3c2e5-ae1e-4318-bea8-e49bfc6b601a@andys-imac.local>
In-Reply-To: <20190724185159.GD5700@beryl>
References: <em8e44e63f-388a-4ff6-ace9-d28ccd87f383@andys-imac.local>
	<20190724185159.GD5700@beryl>
User-Agent: eM_Client/7.2.35700.0
Mime-Version: 1.0
Cc: meta-ti@yoctoproject.org
Subject: Re: Building for AM335x with meta-ti and meta-qt5
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Andy Pont <andy.pont@sdcsystems.com>
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 20:54:56 -0000
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Denys wrote=E2=80=A6=0A=0A>What's your DISTRO, your MACHINE, TUNES and any=
 other special configs?=0ADISTRO is set to =E2=80=9Cpoky=E2=80=9D and machin=
e is set to =E2=80=9Cbeaglebone=E2=80=9D. I=E2=80=99m not =0Aaware of a TUN=
ES option.=0A=0A>It's been working fine for years, hence no recent discussi=
ons. You may want to=0A>look into TI Processor SDK for AM335x - it's Yocto=
 Project based Arago distro=0A>that is configured for Qt5-Wayland/Weston-SGX=
, but has been also tested with=0A>EGLFS QPA.=0AI=E2=80=99ll take a look at =
that and see if it makes for a better solution.=0A=0A-Andy.=0A=0A


