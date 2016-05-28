Return-Path: <aka.pavlya@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0995FE007A2; Sat, 28 May 2016 16:31:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aka.pavlya[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 659F7E00522
	for <meta-ti@yoctoproject.org>; Sat, 28 May 2016 16:31:40 -0700 (PDT)
Received: by mail-lf0-f54.google.com with SMTP id b73so36596809lfb.3
	for <meta-ti@yoctoproject.org>; Sat, 28 May 2016 16:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:references:subject:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=QoNKQIpRm8Zv6ecmIjr2AqaDgqL3SIrdsY2Qf8zQSxo=;
	b=TYtA/o9jGyU/X1q4NZ13BnTUEGMKxVvS4rVVQ4hpOjx4R7NdxFowteUU7mSy5ZyfUT
	mb7p934O66mMhRp5sggdz4v3gxmbd+p7esksAxIsujIw0SDSwtbicLmu25WZ2wWek0p3
	vFIdmg9K5f+WXnsCHjBUjAvDtg3AWL7b+scaaIWf0BPGcOIC1eMCmEVqXAIMwz0wvJAD
	SfQRRp1wB0IHFlErBfTrbQ4YjhH2AXDvxrQ0hYnS4Z0BGhiE050EB9MB71aUaZje8umL
	G6tabb+9HPD5JJeNJ/1fbh92ZJqDaYbMQOA5XzW5xOEaxFimEJb736sZ6FXsPP2Alaap
	85ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:references:subject:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=QoNKQIpRm8Zv6ecmIjr2AqaDgqL3SIrdsY2Qf8zQSxo=;
	b=XmEZIPhxYlrgAMc8JMsKJIbrlDJVspUDCSAYrIMSVDXYEe+8bPsROa+Bi49Lub9v7z
	ygAgbnt85G4kMXItAfferCbzXwmWQ3BA4cV3Gh8csRnZHxTs+B72kpARpauQk/QfsgJe
	KZB7PokRxmiTpfhstXtp0h2svnqpZXYv8LpV6f2oFtGy82DQXa9fX6KIgnZci15x9/cy
	W9Hk6zCRFbUk5qcJAHZ/Uitj7lvm2drW7jlQCIhH+rLxn4j1esKky7XYRB9QF0XV0bpj
	AjPyvBkeISIUwNOEma4lZSoSXieD7ljV9oR5L8S2QFDyLE1XQjb7E3VUv3bN6sbenjFj
	Q9EA==
X-Gm-Message-State: ALyK8tLhdnA9PLE1aobaK70mLYRlKroVQUuf3SB463Qb6eP2LBGxvwyYY3o3lkWS5x5F5A==
X-Received: by 10.25.205.5 with SMTP id d5mr6592261lfg.14.1464478299053;
	Sat, 28 May 2016 16:31:39 -0700 (PDT)
Received: from [192.168.1.3] (73-127-52-37.pool.ukrtel.net. [37.52.127.73])
	by smtp.googlemail.com with ESMTPSA id
	h16sm3744289lfb.7.2016.05.28.16.31.37 for <meta-ti@yoctoproject.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2016 16:31:37 -0700 (PDT)
To: meta-ti@yoctoproject.org
References: <1418376467343.32456.6572@webmail7>
From: Yurii <aka.pavlya@gmail.com>
Message-ID: <574A2A58.2040905@gmail.com>
Date: Sun, 29 May 2016 02:31:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1418376467343.32456.6572@webmail7>
Subject: Re: TI wirelesl WL18xx drivers
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
X-List-Received-Date: Sat, 28 May 2016 23:31:44 -0000
Content-Type: multipart/alternative;
	boundary="------------000105070602030804030201"

--------------000105070602030804030201
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

Could you say me did you start wl18xx?
I face with this module too.

Best regards
Yurii
> Hi again,
>
> On 12/12/2014 11:27 AM, Kalle Komierowski wrote:
> >/Hi Liviu, />//>/Thanks for the quick reply. />/I am using Yocto YP Co=
re - Dizzy 1.7 />/<https://www.yoctoproject.org/downloads/core/dizzy17>, =
the latest. />/I could of had specified a bit better what I've done but I=
 was a bit />/too eager in my last email. />/I started by changing these =
settings compared to the standard />/Beaglebone kernel: />//>/+CONFIG_WL_=
TI=3Dy />/+# CONFIG_WL1251 is not set />/+# CONFIG_WL12XX is not set />/+=
CONFIG_WL18XX=3Dm />/+CONFIG_WLCORE=3Dm />/+# CONFIG_WLCORE_SPI is not se=
t />/+CONFIG_WLCORE_SDIO=3Dm />/+CONFIG_WILINK_PLATFORM_DATA=3Dy />//>/I =
got the modules in my /build/tmp/deploy/images/beaglebone />/modules-beag=
lebone.tgz />//>/When I started my beaglebone I tried lsmod but couldn't =
see the them />/so I tried to modprobe them in but failed. />//>/I'm not =
sitting at my board now so unfortunately I can't say exactly />/what the =
error was but when I googled I saw somebody that also needed />/the compa=
t module. So I figured I could add it to my image. />//>/Well anyway, so =
if I continue on my first track, fixing the kernel />/config to include W=
L18xx, do you have a recommendation on what I could />/do next? /I don't =
have any recommendations regarding the configuration of WL18XX
> yet, since we are currently in the process of getting WL18xx up as well=

> :/), on a board similar to BeagleBone (am335x), on kernel-3.14. />//>/A=
gain, thanks, />/BR />/Kalle />//>//>/On December 12, 2014, Liviu Gheorgh=
isan <liviu.gheorghisan at enea.com=20
> <https://lists.yoctoproject.org/listinfo/meta-ti>> />/wrote: />//>>/Hel=
lo Kalle, />>//>>/Starting with kernel-3.12, the wl18xx drivers are in-tr=
ee, so there />>/is no need any more for a yocto/oe layer to support them=
=2E You just />>/need to activate the required kernel configs in order to=
 have them=20
> built. />>//>>/Google a little for CONFIG_WL18XX and its dependencies. =
/>>//>>//>>/On 12/12/2014 09:44 AM, Kalle Komierowski wrote: />>//>>/Hi a=
ll, />>//>>/I'm new to this list, and new to Yocto. />>/I am about use th=
e TI WL18xx wifi together with Beaglebone. I've />>/seen that the older W=
L12xx drivers are present. />>/I included the />>/meta-openembedded/meta-=
oe/recipes-kernel/compat-wireless />>/layer/recipe but compat-wireless fa=
ils when compiling (maybe a />>/question something for the meta-oe mailin=
g list) />>//>>/I have two questions: />>/1. Is there ongoing work to sup=
port the WL18xx drivers in a />>/yocto/oe layer? (if yes, when will they =
be available?) />>/2. Should this work be done in meta-ti or the />>/meta=
-oe/compat-wireless? />>//>>/Thanks for your time. />>//>>//>>/BR />>/-Ka=
lle Komierowski />>//>>//>>//>>/-- />>/Liviu Gheorghisan />>/Software Eng=
ineer />>//>>/http://www.enea.com /
> --=20
> Liviu Gheorghisan


--------------000105070602030804030201
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi all,<br>
    <br>
    Could you say me did you start wl18xx?<br>
    I face with this module too.<br>
    <br>
    Best regards<br>
    Yurii<br>
    <blockquote type="cite">
      <pre>Hi again,

On 12/12/2014 11:27 AM, Kalle Komierowski wrote:
&gt;<i> Hi Liviu,
</i>&gt;<i>
</i>&gt;<i> Thanks for the quick reply.
</i>&gt;<i> I am using Yocto YP Core - Dizzy 1.7 
</i>&gt;<i> &lt;<a href="https://www.yoctoproject.org/downloads/core/dizzy17">https://www.yoctoproject.org/downloads/core/dizzy17</a>&gt;, the latest.
</i>&gt;<i> I could of had specified a bit better what I've done but I was a bit 
</i>&gt;<i> too eager in my last email.
</i>&gt;<i> I started by changing these settings compared to the standard 
</i>&gt;<i> Beaglebone kernel:
</i>&gt;<i>
</i>&gt;<i> +CONFIG_WL_TI=y
</i>&gt;<i> +# CONFIG_WL1251 is not set
</i>&gt;<i> +# CONFIG_WL12XX is not set
</i>&gt;<i> +CONFIG_WL18XX=m
</i>&gt;<i> +CONFIG_WLCORE=m
</i>&gt;<i> +# CONFIG_WLCORE_SPI is not set
</i>&gt;<i> +CONFIG_WLCORE_SDIO=m
</i>&gt;<i> +CONFIG_WILINK_PLATFORM_DATA=y
</i>&gt;<i>
</i>&gt;<i> I got the modules in my /build/tmp/deploy/images/beaglebone
</i>&gt;<i> modules-beaglebone.tgz
</i>&gt;<i>
</i>&gt;<i> When I started my beaglebone I tried lsmod but couldn't see the them 
</i>&gt;<i> so I tried to modprobe them in but failed.
</i>&gt;<i>
</i>&gt;<i> I'm not sitting at my board now so unfortunately I can't say exactly 
</i>&gt;<i> what the error was but when I googled I saw somebody that also needed 
</i>&gt;<i> the compat module. So I figured I could add it to my image.
</i>&gt;<i>
</i>&gt;<i> Well anyway, so if I continue on my first track, fixing the kernel 
</i>&gt;<i> config to include WL18xx, do you have a recommendation on what I could 
</i>&gt;<i> do next?
</i>I don't have any recommendations regarding the configuration of WL18XX 
yet, since we are currently in the process of getting WL18xx up as well 
:<i>), on a board similar to BeagleBone (am335x), on kernel-3.14.
</i>&gt;<i>
</i>&gt;<i> Again, thanks,
</i>&gt;<i> BR
</i>&gt;<i> Kalle
</i>&gt;<i>
</i>&gt;<i>
</i>&gt;<i> On December 12, 2014, Liviu Gheorghisan &lt;<a href="https://lists.yoctoproject.org/listinfo/meta-ti">liviu.gheorghisan at enea.com</a>&gt; 
</i>&gt;<i> wrote:
</i>&gt;<i>
</i>&gt;&gt;<i> Hello Kalle,
</i>&gt;&gt;<i>
</i>&gt;&gt;<i> Starting with kernel-3.12, the wl18xx drivers are in-tree, so there 
</i>&gt;&gt;<i> is no need any more for a yocto/oe layer to support them. You just 
</i>&gt;&gt;<i> need to activate the required kernel configs in order to have them built.
</i>&gt;&gt;<i>
</i>&gt;&gt;<i> Google a little for CONFIG_WL18XX and its dependencies.
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>
</i>&gt;&gt;<i> On 12/12/2014 09:44 AM, Kalle Komierowski wrote:
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>     Hi all,
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>     I'm new to this list, and new to Yocto.
</i>&gt;&gt;<i>     I am about use the TI WL18xx wifi together with Beaglebone. I've
</i>&gt;&gt;<i>     seen that the older WL12xx drivers are present.
</i>&gt;&gt;<i>     I included the
</i>&gt;&gt;<i>     meta-openembedded/meta-oe/recipes-kernel/compat-wireless
</i>&gt;&gt;<i>     layer/recipe but compat-wireless fails when compiling (maybe a
</i>&gt;&gt;<i>     question something for the meta-oe mailing list)
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>     I have two questions:
</i>&gt;&gt;<i>     1. Is there ongoing work to support the WL18xx drivers in a
</i>&gt;&gt;<i>     yocto/oe layer? (if yes, when will they be available?)
</i>&gt;&gt;<i>     2. Should this work be done in meta-ti or the
</i>&gt;&gt;<i>     meta-oe/compat-wireless?
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>     Thanks for your time.
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>     BR
</i>&gt;&gt;<i>     -Kalle Komierowski
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>
</i>&gt;&gt;<i>
</i>&gt;&gt;<i> -- 
</i>&gt;&gt;<i> Liviu Gheorghisan
</i>&gt;&gt;<i> Software Engineer
</i>&gt;&gt;<i>
</i>&gt;&gt;<i> <a href="http://www.enea.com">http://www.enea.com</a>
</i>
-- 
Liviu Gheorghisan
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000105070602030804030201--
