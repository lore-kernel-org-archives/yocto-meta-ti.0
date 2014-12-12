Return-Path: <kalle@zapdevelopment.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DC9CE009A5; Fri, 12 Dec 2014 01:28:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [195.47.247.221 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 62 seconds by postgrey-1.32 at yocto-www;
	Fri, 12 Dec 2014 01:28:52 PST
Received: from mailrelay3.public.one.com (mailrelay3.public.one.com
	[195.47.247.221])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFFA9E0099A
	for <meta-ti@yoctoproject.org>; Fri, 12 Dec 2014 01:28:52 -0800 (PST)
X-HalOne-Cookie: 3f26a1f3562d42744fd9c0b85c931023b94f8aa8
X-HalOne-ID: d2e6f73e-81e0-11e4-ba3a-b8ca3afa9d73
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=zapdevelopment.com; s=20140924;
	h=from:reply-to:subject:date:message-id:to:cc:mime-version:content-type:
	in-reply-to:references;
	bh=nvuewNqxSHbMctbEF1FEZbxmIA+2HFW9U+enAVdbqfw=;
	b=Iar/rJrdm08c2BsyQhGNcG4f5iA+zza7BzoB+ceWERMv3/MXXZKws05Hssl4wBzbqIX7SqpWgftLx
	ALGrVFWjE6uLViwixPjg55J2IA/Xv7ZBqsSx+Q8W7prdu17Aq+CUjipmjFzwnlywhperHC5Actw4gW
	neZmEG/AxjAxUjoI=
Received: from webmail7 (unknown [10.246.6.7])
	by smtpfilter1.public.one.com (Halon Mail Gateway) with SMTP;
	Fri, 12 Dec 2014 09:25:33 +0000 (GMT)
X-Originating-IP: 10.246.4.241
User-Agent: One.com webmail 9.6.1
In-Reply-To: <548AAB1B.1000207@enea.com>
References: <548AAB1B.1000207@enea.com>
MIME-Version: 1.0
Message-ID: <1418376467343.32456.6572@webmail7>
Date: Fri, 12 Dec 2014 09:27:47 GMT
To: "Liviu Gheorghisan" <liviu.gheorghisan@enea.com>
From: "Kalle Komierowski" <kalle@zapdevelopment.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: TI wirelesl WL18xx drivers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: kalle@zapdevelopment.com
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Dec 2014 09:28:55 -0000
Content-Type: multipart/alternative; boundary="----------6570-1418376467343-1"

------------6570-1418376467343-1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Liviu,

Thanks for the quick reply.
I am using Yocto YP Core - Dizzy 1.7 <https://www.yoctoproject.org/download=
s/core/dizzy17>, the latest.
I could of had specified a bit better what I've done but I was a bit too ea=
ger in my last email.
I started by changing these settings compared to the standard Beaglebone ke=
rnel:

+CONFIG_WL_TI=3Dy
+# CONFIG_WL1251 is not set
+# CONFIG_WL12XX is not set
+CONFIG_WL18XX=3Dm
+CONFIG_WLCORE=3Dm
+# CONFIG_WLCORE_SPI is not set
+CONFIG_WLCORE_SDIO=3Dm
+CONFIG_WILINK_PLATFORM_DATA=3Dy

I got the modules in my /build/tmp/deploy/images/beaglebone
modules-beaglebone.tgz

When I started my beaglebone I tried lsmod but couldn't see the them so I t=
ried to modprobe them in but failed.

I'm not sitting at my board now so unfortunately I can't say exactly what t=
he error was but when I googled I saw somebody that also needed the compat =
module. So I figured I could add it to my image.

Well anyway, so if I continue on my first track, fixing the kernel config t=
o include WL18xx, do you have a recommendation on what I could do next?

Again, thanks,
BR
Kalle



On December 12, 2014, Liviu Gheorghisan <liviu.gheorghisan@enea.com> wrote:=

> Hello Kalle,
>=20
> Starting with kernel-3.12, the wl18xx drivers are in-tree, so there is no=
 need any more for a yocto/oe layer to support them. You just need to activ=
ate the required kernel configs in order to have them built.
>=20
> Google a little for CONFIG_WL18XX and its dependencies.
>=20
>=20
> On 12/12/2014 09:44 AM, Kalle Komierowski wrote:
>=20
> > Hi all,
> >=20
> > I'm new to this list, and new to Yocto.
> > I am about use the TI WL18xx wifi together with Beaglebone. I've seen t=
hat the older WL12xx drivers are present.
> > I included the
> > meta-openembedded/meta-oe/recipes-kernel/compat-wireless
> > layer/recipe but compat-wireless fails when compiling (maybe a question=
 something for the meta-oe mailing list)
> >=20
> > I have two questions:
> > 1. Is there ongoing work to support the WL18xx drivers in a yocto/oe la=
yer? (if yes, when will they be available?)
> > 2. Should this work be done in meta-ti or the meta-oe/compat-wireless?
> >=20
> > Thanks for your time.
> >=20
> >=20
> > BR
> > -Kalle Komierowski
> >=20
> >=20
> >=20
>=20
>=20
> --=20
> Liviu Gheorghisan
> Software Engineer
> 
> <http://www.enea.com>

------------6570-1418376467343-1
Content-Type: multipart/related; boundary="----------6570-1418376467343-2"

------------6570-1418376467343-2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

Hi Liviu,<br /><br />Thanks for the quick reply.<br />I am using Yocto <a h=
ref=3D"https://www.yoctoproject.org/downloads/core/dizzy17">YP Core - Dizzy=
 1.7</a>, the latest.<br />I could of had specified a bit better what I've =
done but I was a bit too eager in my last email.<br />I started by changing=
 these settings compared to the standard Beaglebone kernel:<br /><br />+CON=
FIG_WL_TI=3Dy<br />+# CONFIG_WL1251 is not set<br />+# CONFIG_WL12XX is not=
 set<br />+CONFIG_WL18XX=3Dm<br />+CONFIG_WLCORE=3Dm<br />+# CONFIG_WLCORE_=
SPI is not set<br />+CONFIG_WLCORE_SDIO=3Dm<br />+CONFIG_WILINK_PLATFORM_DA=
TA=3Dy<br /><br />I got the modules in my /build/tmp/deploy/images/beaglebo=
ne<br />modules-beaglebone.tgz<br /><br />When I started my beaglebone I tr=
ied lsmod but couldn't see the them so I tried to modprobe them in but fail=
ed.<br /><br />I'm not sitting at my board now so unfortunately I can't say=
 exactly what the error was but when I googled I saw somebody that also nee=
ded the compat module. So I figured I could add it to my image.<br /><br />=
Well anyway, so if I continue on my first track, fixing the kernel config t=
o include WL18xx, do you have a recommendation on what I could do next?<br =
/><br />Again, thanks,<br />BR<br />Kalle<br /><br /><br /><p>On December 1=
2, 2014, Liviu Gheorghisan &lt;liviu.gheorghisan@enea.com&gt; wrote:</p><bl=
ockquote type=3D"cite"><div class=3D"oneComWebmail-html oneComWebmail-mail"=
>
 =20
   =20
 =20
  <div class=3D"oneComWebmail-body" style=3D"color: #000000; background-col=
or: #FFFFFF;">
    Hello Kalle,<br />
    <br />
    Starting with kernel-3.12, the wl18xx drivers are in-tree, so there
    is no need any more for a yocto/oe layer to support them. You just
    need to activate the required kernel configs in order to have them
    built.<br />
    <br />
    Google a little for CONFIG_WL18XX and its dependencies.<br />
    <br />
    <br />
    <div class=3D"oneComWebmail-moz-cite-prefix">On 12/12/2014 09:44 AM, Ka=
lle
      Komierowski wrote:<br />
    </div>
    <blockquote>
     =20
      Hi all, <br />
      <br />
      I'm new to this list, and new to Yocto.<br />
      I am about use the TI WL18xx wifi together with Beaglebone. I've
      seen that the older WL12xx drivers are present.<br />
      I included the <br />
      meta-openembedded/meta-oe/recipes-kernel/compat-wireless<br />
      layer/recipe but compat-wireless fails when compiling (maybe a
      question something for the meta-oe mailing list)<br />
      <br />
      I have two questions:<br />
      1. Is there ongoing work to support the WL18xx drivers in a
      yocto/oe layer? (if yes, when will they be available?)<br />
      2. Should this work be done in meta-ti or the
      meta-oe/compat-wireless?<br />
      <br />
      Thanks for your time.<br />
      <br />
      <br />
      BR<br />
      -Kalle Komierowski<br />
      <br />
     =20
      <br />
    </blockquote>
    <br />
    <pre class=3D"oneComWebmail-moz-signature">--=20
Liviu Gheorghisan
Software Engineer

<a class=3D"oneComWebmail-moz-txt-link-freetext" href=3D"http://www.enea.co=
m" target=3D"_blank">http://www.enea.com</a></pre>
  </div>
</div></blockquote>

------------6570-1418376467343-2--

------------6570-1418376467343-1--
