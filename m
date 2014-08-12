Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D17E4E0079A; Tue, 12 Aug 2014 16:04:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6665DE00796
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 16:04:04 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CN3xYb004948;
	Tue, 12 Aug 2014 18:03:59 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CN3x1Q028449;
	Tue, 12 Aug 2014 18:03:59 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 12 Aug 2014 18:03:59 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "alexandre.belloni@free-electrons.com"
	<alexandre.belloni@free-electrons.com>, "diego.sueiro@gmail.com"
	<diego.sueiro@gmail.com>
Thread-Topic: [meta-ti] Alexandre Belloni : beaglebone: use the
	am335x_boneblack u-boot configuration
Thread-Index: AQHPtilLmNu/Dr9BBkOXuKAkx2snS5vNJJ6AgAC6RwCAAAufAP//rI9H
Date: Tue, 12 Aug 2014 23:03:58 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE7320BBDC5@DLEE08.ent.ti.com>
References: <20140812020344.BF28052981@arago-project.org>
	<CAMCfZKFhAVNKZP2X5jATWOWwrtk4TdBK5VADsui+dTWACAHr9g@mail.gmail.com>
	<20140812151419.GF23523@edge> <20140812222101.GB16009@piout.net>,
	<CAMCfZKGNewfvERQczxPpEwDYGk21OvdLLPqzvL+BmLFoArsmRQ@mail.gmail.com>
In-Reply-To: <CAMCfZKGNewfvERQczxPpEwDYGk21OvdLLPqzvL+BmLFoArsmRQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"git@arago-project.org" <git@arago-project.org>
Subject: Re: Alexandre Belloni : beaglebone: use the am335x_boneblack u-boot configuration
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
X-List-Received-Date: Tue, 12 Aug 2014 23:04:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE7320BBDC5DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE7320BBDC5DLEE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Same here, it was failing the configure step.


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Diego Sueiro [diego.sueiro@gmail.com]
Received: Tuesday, 12 Aug 2014, 19:03
To: Alexandre Belloni [alexandre.belloni@free-electrons.com]
CC: Dmytriyenko, Denys [denys@ti.com]; meta-ti mailing list [meta-ti@yoctop=
roject.org]; Arago Project git [git@arago-project.org]
Subject: Re: [meta-ti] Alexandre Belloni : beaglebone: use the am335x_boneb=
lack u-boot configuration

Hi Alexandre,

On Tue, Aug 12, 2014 at 7:21 PM, Alexandre Belloni <alexandre.belloni@free-=
electrons.com<mailto:alexandre.belloni@free-electrons.com>> wrote:
Hi,

On 12/08/2014 at 11:14:19 -0400, Denys Dmytriyenko wrote :
> > > diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.c=
onf
> > > index 8a83a1a..0b4dce3 100644
> > > --- a/conf/machine/beaglebone.conf
> > > +++ b/conf/machine/beaglebone.conf
> > > @@ -11,4 +11,4 @@ IMAGE_FSTYPES +=3D "tar.gz"
> > >
> > >  SERIAL_CONSOLE =3D "115200 ttyO0"
> > >
> > > -UBOOT_MACHINE =3D "am335x_evm_config"
> > > +UBOOT_MACHINE =3D "am335x_boneblack"
> > >
> >
> > There is a typo here. Must be "am335x_boneblack_config" instead of
> > "am335x_boneblack"
>
> Goot catch, thanks!
>

I tried, both are working. I didn't think that patch would be merged
that fast, sorry about that.

It did not worked for me. I had to put "am335x_boneblack_config"

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatura=
_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/

--_000_B0581B5571079145BA1CD78C126DBDE7320BBDC5DLEE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Same here, it was failing the configure step.<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Diego Sueiro [diego.sueiro@gmail.com]<br>
<b>Received:</b> Tuesday, 12 Aug 2014, 19:03<br>
<b>To:</b> Alexandre Belloni [alexandre.belloni@free-electrons.com]<br>
<b>CC:</b> Dmytriyenko, Denys [denys@ti.com]; meta-ti mailing list [meta-ti=
@yoctoproject.org]; Arago Project git [git@arago-project.org]<br>
<b>Subject:</b> Re: [meta-ti] Alexandre Belloni : beaglebone: use the am335=
x_boneblack u-boot configuration<br>
<br>
</span></span>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra">Hi Alexandre,</div>
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On Tue, Aug 12, 2014 at 7:21 PM, Alexandre Bello=
ni <span dir=3D"ltr">
&lt;<a href=3D"mailto:alexandre.belloni@free-electrons.com" target=3D"_blan=
k">alexandre.belloni@free-electrons.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; border=
-left-width:1px; border-left-color:rgb(204,204,204); border-left-style:soli=
d; padding-left:1ex">
<div id=3D":1im" class=3D"" style=3D"overflow:hidden">Hi,<br>
<br>
On 12/08/2014 at 11:14:19 -0400, Denys Dmytriyenko wrote :<br>
<div class=3D"">&gt; &gt; &gt; diff --git a/conf/machine/beaglebone.conf b/=
conf/machine/beaglebone.conf<br>
&gt; &gt; &gt; index 8a83a1a..0b4dce3 100644<br>
&gt; &gt; &gt; --- a/conf/machine/beaglebone.conf<br>
&gt; &gt; &gt; &#43;&#43;&#43; b/conf/machine/beaglebone.conf<br>
&gt; &gt; &gt; @@ -11,4 &#43;11,4 @@ IMAGE_FSTYPES &#43;=3D &quot;tar.gz&qu=
ot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &nbsp;SERIAL_CONSOLE =3D &quot;115200 ttyO0&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -UBOOT_MACHINE =3D &quot;am335x_evm_config&quot;<br>
&gt; &gt; &gt; &#43;UBOOT_MACHINE =3D &quot;am335x_boneblack&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; There is a typo here. Must be &quot;am335x_boneblack_config&quot;=
 instead of<br>
&gt; &gt; &quot;am335x_boneblack&quot;<br>
&gt;<br>
&gt; Goot catch, thanks!<br>
&gt;<br>
<br>
</div>
I tried, both are working. I didn't think that patch would be merged<br>
that fast, sorry about that.</div>
</blockquote>
</div>
<br>
It did not worked for me. I had to put &quot;am335x_boneblack_config&quot;<=
br>
<br clear=3D"all">
<div>
<div dir=3D"ltr">
<div>Regards,</div>
<div><br>
</div>
--<br>
*dS<br>
Diego Sueiro<br>
<br>
Administrador do Embarcados<br>
<a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;=
utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=
=3D"_blank">www.embarcados.com.br</a><br>
<br>
/*long live rock 'n roll*/<br>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE7320BBDC5DLEE08entticom_--
