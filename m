Return-Path: <Tim.Verstraete@medecbenelux.be>
Received: from mail.medecbenelux.be (mail.medecbenelux.be [81.83.14.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D943FE0044A;
	Wed,  1 Aug 2012 03:52:14 -0700 (PDT)
Received: from SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407]) by
	SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407%10]) with mapi
	id 14.01.0355.002; Wed, 1 Aug 2012 12:52:12 +0200
From: Tim Verstraete <Tim.Verstraete@medecbenelux.be>
To: "Iorga, Cristian" <cristian.iorga@intel.com>, Denys Dmytriyenko
	<denys@ti.com>
Thread-Topic: [SPAM] - RE: [meta-ti] [HOB] issue - Email found in subject
Thread-Index: AQHNb7zFHa2h+DpMHE2Sa3w+/uQ77JdEx7LQ
Date: Wed, 1 Aug 2012 10:52:11 +0000
Message-ID: <4439C3C0562087488F139C696CD862A72C1973@SBS-MEDEC.medecbenelux.local>
References: <4439C3C0562087488F139C696CD862A72C188D@SBS-MEDEC.medecbenelux.local><20120731201047.GB21245@edge>
	<4439C3C0562087488F139C696CD862A72C194B@SBS-MEDEC.medecbenelux.local>
	<969F26A8BAB325438E7EB80D3C3134FB161773A6@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161773A6@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2002:5153:ef2:0:4cfb:295e:12ae:b5bc]
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Aug 2012 10:05:58 -0700
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: [SPAM] - RE: [HOB] issue - Email found in subject
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
X-List-Received-Date: Wed, 01 Aug 2012 10:52:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK. Where can I find the log file to add to the bugzilla ...

Kind regards,

Tim


-----Original Message-----
From: Iorga, Cristian [mailto:cristian.iorga@intel.com]=20
Sent: woensdag 1 augustus 2012 10:08
To: Tim Verstraete; Denys Dmytriyenko
Cc: meta-ti@yoctoproject.org; yocto@yoctoproject.org
Subject: [SPAM] - RE: [meta-ti] [HOB] issue - Email found in subject

Hello Tim,

Please fill in a bug report at bugzilla.yoctoproject.org It will be investi=
gated later on.

Regards,
Cristian Iorga

-----Original Message-----
From: yocto-bounces@yoctoproject.org [mailto:yocto-bounces@yoctoproject.org=
] On Behalf Of Tim Verstraete
Sent: Wednesday, August 01, 2012 9:29 AM
To: Denys Dmytriyenko
Cc: meta-ti@yoctoproject.org; yocto@yoctoproject.org
Subject: Re: [yocto] [meta-ti] [HOB] issue

 Hi,
=20
 When i use the HOB functionality in yocto with the meta-ti, I get an  erro=
r message after about 5% with no error message in it. I can only press clos=
e.
=20
 I use the default layers but I do see that HOB re-arranges them into:
 Poky/meta
 Poky/meta-hob
 Poky/meta-ti
 Poky/meta-yocto
=20
 I see that I can build using the command line so it has to be  something w=
ith HOB and not necessary something in yocto.

Thanks in advance,

Kind regards,

Tim

-----Original Message-----
From: Denys Dmytriyenko [mailto:denys@ti.com]
Sent: dinsdag 31 juli 2012 22:11
To: Tim Verstraete
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [HOB] issue

On Tue, Jul 31, 2012 at 12:04:37PM +0000, Tim Verstraete wrote:
> Hi,
>=20
> When i use the HOB functionality in yocto with the meta-ti, I get an=20
> error message after about 5% with no error message in it. I can only pres=
s close.
>=20
> I use the default layers but I do see that HOB re-arranges them into:
> Poky/meta
> Poky/meta-hob
> Poky/meta-ti
> Poky/meta-yocto
>=20
> I see that I can build using the command line so it has to be=20
> something with HOB and not necessary something in yocto.

Well, HOB _is_ part of Yocto anyway. While meta-ti may be triggering the is=
sue in HOB, you better off reporting it to the main yocto mailing list - fe=
el free to copy meta-ti as well.

--
Denys
_______________________________________________
yocto mailing list
yocto@yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto

