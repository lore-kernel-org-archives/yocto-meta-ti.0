Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E0C4E0073F
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 06:34:10 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:60333)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2C359> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Fri, 16 Aug 2013 15:33:33 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Fri, 16 Aug 2013 16:33:02 +0200
Message-ID: <16201032.WYlyniCXd1@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB9760A@DBDE04.ent.ti.com>
References: <19394510.IQgu9b8fOF@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB9760A@DBDE04.ent.ti.com>
MIME-Version: 1.0
Subject: Re: Kernel crash running omap3-sgx-modules_4.05.00.03 on 3.x	kernels
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
X-List-Received-Date: Fri, 16 Aug 2013 13:34:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

> Have you enabled the clocks - looks like the pvrsrv-init (or an init =
script
> of similar name) has not been run before and pvrsrv-ctl is not run ?
How can i check it? In dmesg, there is a "Starting PVR" message, i do n=
ot see=20
others.
Everything is in default state, i have not changed anything. It works w=
ith=20
2.6.39 kernel, built the same way.
I found a script '/usr/bin/pvrsrvinit': if i start it after boot then i=
t=20
returns immediately without printing anything, and the system fails the=
 same=20
way starting any gles application.

Regards
Gy=F6rgy K=F6vesdi



