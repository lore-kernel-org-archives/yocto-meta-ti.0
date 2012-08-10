Return-Path: <Tim.Verstraete@medecbenelux.be>
Received: from mail.medecbenelux.be (mail.medecbenelux.be [81.83.14.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B912E013BB
	for <meta-ti@yoctoproject.org>; Fri, 10 Aug 2012 02:00:53 -0700 (PDT)
Received: from SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407]) by
	SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407%10]) with mapi
	id 14.01.0355.002; Fri, 10 Aug 2012 11:00:52 +0200
From: Tim Verstraete <Tim.Verstraete@medecbenelux.be>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [SPAM] - Re: [meta-ti] [meta-ti / pandaboard] SGX / powervr
	drivers - Email found in subject
Thread-Index: AQHNdtXOhJcE5uW0FUu2DIchQ1p30ZdSv3iw
Date: Fri, 10 Aug 2012 09:00:51 +0000
Message-ID: <4439C3C0562087488F139C696CD862A713213578@SBS-MEDEC.medecbenelux.local>
References: <4439C3C0562087488F139C696CD862A71321053E@SBS-MEDEC.medecbenelux.local>
	<0819C8B7-38BB-4561-A0F7-FB3BA657FE52@dominion.thruhere.net>
In-Reply-To: <0819C8B7-38BB-4561-A0F7-FB3BA657FE52@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2002:5153:ef2:0:8194:a0c6:23da:d964]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [SPAM] - Re: [meta-ti / pandaboard] SGX / powervr drivers - Email found in subject
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
X-List-Received-Date: Fri, 10 Aug 2012 09:00:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Indeed does make sense ... so this would mean that I now have to make 2 rec=
ipes for the pandaboard, one for each.

Kind regards,

Tim


-----Original Message-----
From: Koen Kooi [mailto:koen@dominion.thruhere.net]=20
Sent: vrijdag 10 augustus 2012 10:55
To: Tim Verstraete
Cc: meta-ti@yoctoproject.org
Subject: [SPAM] - Re: [meta-ti] [meta-ti / pandaboard] SGX / powervr driver=
s - Email found in subject


Op 10 aug. 2012, om 10:34 heeft Tim Verstraete <Tim.Verstraete@medecbenelux=
.be> het volgende geschreven:

> Hi,
> =20
> i am using a pandaboard with meta-ti and i see that in meta-ti we have th=
e following:
> =B7        Root/recipes-bsp/powervrdrivers
> o   Omap3-sgx-modules
> o   Omap3 bb file
> =B7        Root/recipes-graphics/
> o   Libgles
> =A7  Libgles-omap3.inc
> =A7  Libgles-omap3
> =A7  Libgles-omap3 recipe
> o   Omapfbplay
> o   Xorgxserver
> =20
> Now I have 2 questions about this .
> =B7        why would we need 2 locations for this since when I look in th=
e recipe they use the same source binary but handle it different, is this o=
ne recipe for driver and one recipe for opengles library? Why not do it in =
one shot?

Kernel and userspace builds are quite different and in general the kernel g=
ets updated more often than the sgx userspace. Instead of "rebuilding" the =
userspace binaries everytime a kernel changes we only rebuild the kernel mo=
dules.
Even if the kernel never changed, building both kernel modules and userspac=
e in the same recipe should never be done.

regards,

Koen

