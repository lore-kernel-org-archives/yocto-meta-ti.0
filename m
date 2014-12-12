Return-Path: <Liviu.Gheorghisan@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE717E00993; Fri, 12 Dec 2014 00:45:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id F0EC2E0083A
	for <meta-ti@yoctoproject.org>; Fri, 12 Dec 2014 00:45:21 -0800 (PST)
Received: from [192.168.14.95] (192.168.14.95) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.158.1;
	Fri, 12 Dec 2014 09:45:15 +0100
Message-ID: <548AAB1B.1000207@enea.com>
Date: Fri, 12 Dec 2014 10:45:15 +0200
From: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <kalle@zapdevelopment.com>, <meta-ti@yoctoproject.org>
References: <1418370266664.32456.5724@webmail7>
In-Reply-To: <1418370266664.32456.5724@webmail7>
X-Originating-IP: [192.168.14.95]
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
X-List-Received-Date: Fri, 12 Dec 2014 08:45:26 -0000
Content-Type: multipart/alternative;
	boundary="------------090308000701050904010705"

--------------090308000701050904010705
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hello Kalle,

Starting with kernel-3.12, the wl18xx drivers are in-tree, so there is 
no need any more for a yocto/oe layer to support them. You just need to 
activate the required kernel configs in order to have them built.

Google a little for CONFIG_WL18XX and its dependencies.


On 12/12/2014 09:44 AM, Kalle Komierowski wrote:
> Hi all,
>
> I'm new to this list, and new to Yocto.
> I am about use the TI WL18xx wifi together with Beaglebone. I've seen 
> that the older WL12xx drivers are present.
> I included the
> meta-openembedded/meta-oe/recipes-kernel/compat-wireless
> layer/recipe but compat-wireless fails when compiling (maybe a 
> question something for the meta-oe mailing list)
>
> I have two questions:
> 1. Is there ongoing work to support the WL18xx drivers in a yocto/oe 
> layer? (if yes, when will they be available?)
> 2. Should this work be done in meta-ti or the meta-oe/compat-wireless?
>
> Thanks for your time.
>
>
> BR
> -Kalle Komierowski
>
>

-- 
Liviu Gheorghisan
Software Engineer

http://www.enea.com


--------------090308000701050904010705
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hello Kalle,<br>
    <br>
    Starting with kernel-3.12, the wl18xx drivers are in-tree, so there
    is no need any more for a yocto/oe layer to support them. You just
    need to activate the required kernel configs in order to have them
    built.<br>
    <br>
    Google a little for CONFIG_WL18XX and its dependencies.<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 12/12/2014 09:44 AM, Kalle
      Komierowski wrote:<br>
    </div>
    <blockquote cite="mid:1418370266664.32456.5724@webmail7" type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      Hi all, <br>
      <br>
      I'm new to this list, and new to Yocto.<br>
      I am about use the TI WL18xx wifi together with Beaglebone. I've
      seen that the older WL12xx drivers are present.<br>
      I included the <br>
      meta-openembedded/meta-oe/recipes-kernel/compat-wireless<br>
      layer/recipe but compat-wireless fails when compiling (maybe a
      question something for the meta-oe mailing list)<br>
      <br>
      I have two questions:<br>
      1. Is there ongoing work to support the WL18xx drivers in a
      yocto/oe layer? (if yes, when will they be available?)<br>
      2. Should this work be done in meta-ti or the
      meta-oe/compat-wireless?<br>
      <br>
      Thanks for your time.<br>
      <br>
      <br>
      BR<br>
      -Kalle Komierowski<br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Liviu Gheorghisan
Software Engineer

<a class="moz-txt-link-freetext" href="http://www.enea.com">http://www.enea.com</a></pre>
  </body>
</html>

--------------090308000701050904010705--
