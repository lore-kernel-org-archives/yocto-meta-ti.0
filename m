Return-Path: <andy.pont@sdcsystems.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6985BE00D75; Thu, 25 Jul 2019 01:49:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [216.40.44.110 listed in list.dnswl.org]
	* 0.0 MIME_QP_LONG_LINE RAW: Quoted-printable line longer than 76 chars
Received: from smtprelay.hostedemail.com (smtprelay0110.hostedemail.com
	[216.40.44.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9EDDE00D59
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2019 01:49:50 -0700 (PDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay04.hostedemail.com (Postfix) with ESMTP id 3A85F180A8133;
	Thu, 25 Jul 2019 08:49:49 +0000 (UTC)
X-Session-Marker: 616E64792E706F6E744073646373797374656D732E636F6D
X-HE-Tag: eye01_55a55ae413129
X-Filterd-Recvd-Size: 1451
Received: from [192.168.10.100] (unknown [5.133.40.160])
	(Authenticated sender: andy.pont@sdcsystems.com)
	by omf03.hostedemail.com (Postfix) with ESMTPA;
	Thu, 25 Jul 2019 08:49:48 +0000 (UTC)
From: "Andy Pont" <andy.pont@sdcsystems.com>
To: "Ankur Tyagi" <ankur.tyagi85@gmail.com>
Date: Thu, 25 Jul 2019 08:49:47 +0000
Message-Id: <em51dbd303-8bf5-4c7e-81d3-8c671358caaa@andys-imac.local>
In-Reply-To: <CADySD0FixCQpE-yDVEOySTYvNMs8Gu58K3nvaW-a7gWi2gw_uw@mail.gmail.com>
References: <mailman.17419.1563996558.2881.meta-ti@yoctoproject.org>
	<CADySD0FixCQpE-yDVEOySTYvNMs8Gu58K3nvaW-a7gWi2gw_uw@mail.gmail.com>
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
X-List-Received-Date: Thu, 25 Jul 2019 08:49:51 -0000
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ankur wrote...=0A=0A>We have been using Thud release from meta-arago and it =
builds Qt5.11.3=0A>with EGLFS for AM335x.=0A>Make sure add DISTRO_FEATURES=
_remove =3D "wayland" in your local.conf=0AI have got dispensation from our =
client to use Thud so have checked out =0Athe appropriate branches for Pok=
y, meta-ti, meta-arago, etc. into a new =0Adevelopment directory.=0A=0AWhat =
do you have the MACHINE and DISTRO variables set to in your =0Alocal.conf=
 and what image do you bitbake?=0A=0A-Andy.=0A=0A


