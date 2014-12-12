Return-Path: <Liviu.Gheorghisan@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0BFEE009A3; Fri, 12 Dec 2014 03:49:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 011CEE00872
	for <meta-ti@yoctoproject.org>; Fri, 12 Dec 2014 03:49:47 -0800 (PST)
Received: from [192.168.14.95] (192.168.14.95) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.158.1;
	Fri, 12 Dec 2014 12:49:39 +0100
Message-ID: <548AD652.4060900@enea.com>
Date: Fri, 12 Dec 2014 13:49:38 +0200
From: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <kalle@zapdevelopment.com>
References: <548AAB1B.1000207@enea.com> <1418376467343.32456.6572@webmail7>
In-Reply-To: <1418376467343.32456.6572@webmail7>
X-Originating-IP: [192.168.14.95]
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 12 Dec 2014 11:49:51 -0000
Content-Type: multipart/alternative;
	boundary="------------000405030607070206000100"

--------------000405030607070206000100
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi again,

On 12/12/2014 11:27 AM, Kalle Komierowski wrote:
> Hi Liviu,
>
> Thanks for the quick reply.
> I am using Yocto YP Core - Dizzy 1.7 
> <https://www.yoctoproject.org/downloads/core/dizzy17>, the latest.
> I could of had specified a bit better what I've done but I was a bit 
> too eager in my last email.
> I started by changing these settings compared to the standard 
> Beaglebone kernel:
>
> +CONFIG_WL_TI=y
> +# CONFIG_WL1251 is not set
> +# CONFIG_WL12XX is not set
> +CONFIG_WL18XX=m
> +CONFIG_WLCORE=m
> +# CONFIG_WLCORE_SPI is not set
> +CONFIG_WLCORE_SDIO=m
> +CONFIG_WILINK_PLATFORM_DATA=y
>
> I got the modules in my /build/tmp/deploy/images/beaglebone
> modules-beaglebone.tgz
>
> When I started my beaglebone I tried lsmod but couldn't see the them 
> so I tried to modprobe them in but failed.
>
> I'm not sitting at my board now so unfortunately I can't say exactly 
> what the error was but when I googled I saw somebody that also needed 
> the compat module. So I figured I could add it to my image.
>
> Well anyway, so if I continue on my first track, fixing the kernel 
> config to include WL18xx, do you have a recommendation on what I could 
> do next?
I don't have any recommendations regarding the configuration of WL18XX 
yet, since we are currently in the process of getting WL18xx up as well 
:), on a board similar to BeagleBone (am335x), on kernel-3.14.
>
> Again, thanks,
> BR
> Kalle
>
>
> On December 12, 2014, Liviu Gheorghisan <liviu.gheorghisan@enea.com> 
> wrote:
>
>> Hello Kalle,
>>
>> Starting with kernel-3.12, the wl18xx drivers are in-tree, so there 
>> is no need any more for a yocto/oe layer to support them. You just 
>> need to activate the required kernel configs in order to have them built.
>>
>> Google a little for CONFIG_WL18XX and its dependencies.
>>
>>
>> On 12/12/2014 09:44 AM, Kalle Komierowski wrote:
>>
>>     Hi all,
>>
>>     I'm new to this list, and new to Yocto.
>>     I am about use the TI WL18xx wifi together with Beaglebone. I've
>>     seen that the older WL12xx drivers are present.
>>     I included the
>>     meta-openembedded/meta-oe/recipes-kernel/compat-wireless
>>     layer/recipe but compat-wireless fails when compiling (maybe a
>>     question something for the meta-oe mailing list)
>>
>>     I have two questions:
>>     1. Is there ongoing work to support the WL18xx drivers in a
>>     yocto/oe layer? (if yes, when will they be available?)
>>     2. Should this work be done in meta-ti or the
>>     meta-oe/compat-wireless?
>>
>>     Thanks for your time.
>>
>>
>>     BR
>>     -Kalle Komierowski
>>
>>
>>
>> -- 
>> Liviu Gheorghisan
>> Software Engineer
>>
>> http://www.enea.com

-- 
Liviu Gheorghisan


--------------000405030607070206000100
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi again,<br>
    <br>
    <div class="moz-cite-prefix">On 12/12/2014 11:27 AM, Kalle
      Komierowski wrote:<br>
    </div>
    <blockquote cite="mid:1418376467343.32456.6572@webmail7" type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      Hi Liviu,<br>
      <br>
      Thanks for the quick reply.<br>
      I am using Yocto <a moz-do-not-send="true"
        href="https://www.yoctoproject.org/downloads/core/dizzy17">YP
        Core - Dizzy 1.7</a>, the latest.<br>
      I could of had specified a bit better what I've done but I was a
      bit too eager in my last email.<br>
      I started by changing these settings compared to the standard
      Beaglebone kernel:<br>
      <br>
      +CONFIG_WL_TI=y<br>
      +# CONFIG_WL1251 is not set<br>
      +# CONFIG_WL12XX is not set<br>
      +CONFIG_WL18XX=m<br>
      +CONFIG_WLCORE=m<br>
      +# CONFIG_WLCORE_SPI is not set<br>
      +CONFIG_WLCORE_SDIO=m<br>
      +CONFIG_WILINK_PLATFORM_DATA=y<br>
      <br>
      I got the modules in my /build/tmp/deploy/images/beaglebone<br>
      modules-beaglebone.tgz<br>
      <br>
      When I started my beaglebone I tried lsmod but couldn't see the
      them so I tried to modprobe them in but failed.<br>
      <br>
      I'm not sitting at my board now so unfortunately I can't say
      exactly what the error was but when I googled I saw somebody that
      also needed the compat module. So I figured I could add it to my
      image.<br>
      <br>
      Well anyway, so if I continue on my first track, fixing the kernel
      config to include WL18xx, do you have a recommendation on what I
      could do next?<br>
    </blockquote>
    I don't have any recommendations regarding the configuration of
    WL18XX yet, since we are currently in the process of getting WL18xx
    up as well :), on a board similar to BeagleBone (am335x), on
    kernel-3.14.<br>
    <blockquote cite="mid:1418376467343.32456.6572@webmail7" type="cite"><br>
      Again, thanks,<br>
      BR<br>
      Kalle<br>
      <br>
      <br>
      <p>On December 12, 2014, Liviu Gheorghisan
        <a class="moz-txt-link-rfc2396E" href="mailto:liviu.gheorghisan@enea.com">&lt;liviu.gheorghisan@enea.com&gt;</a> wrote:</p>
      <blockquote type="cite">
        <div class="oneComWebmail-html oneComWebmail-mail">
          <div class="oneComWebmail-body" style="color: #000000;
            background-color: #FFFFFF;"> Hello Kalle,<br>
            <br>
            Starting with kernel-3.12, the wl18xx drivers are in-tree,
            so there is no need any more for a yocto/oe layer to support
            them. You just need to activate the required kernel configs
            in order to have them built.<br>
            <br>
            Google a little for CONFIG_WL18XX and its dependencies.<br>
            <br>
            <br>
            <div class="oneComWebmail-moz-cite-prefix">On 12/12/2014
              09:44 AM, Kalle Komierowski wrote:<br>
            </div>
            <blockquote> Hi all, <br>
              <br>
              I'm new to this list, and new to Yocto.<br>
              I am about use the TI WL18xx wifi together with
              Beaglebone. I've seen that the older WL12xx drivers are
              present.<br>
              I included the <br>
              meta-openembedded/meta-oe/recipes-kernel/compat-wireless<br>
              layer/recipe but compat-wireless fails when compiling
              (maybe a question something for the meta-oe mailing list)<br>
              <br>
              I have two questions:<br>
              1. Is there ongoing work to support the WL18xx drivers in
              a yocto/oe layer? (if yes, when will they be available?)<br>
              2. Should this work be done in meta-ti or the
              meta-oe/compat-wireless?<br>
              <br>
              Thanks for your time.<br>
              <br>
              <br>
              BR<br>
              -Kalle Komierowski<br>
              <br>
              <br>
            </blockquote>
            <br>
            <pre class="oneComWebmail-moz-signature">-- 
Liviu Gheorghisan
Software Engineer

<a moz-do-not-send="true" class="oneComWebmail-moz-txt-link-freetext" href="http://www.enea.com" target="_blank">http://www.enea.com</a></pre>
          </div>
        </div>
      </blockquote>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Liviu Gheorghisan
</pre>
  </body>
</html>

--------------000405030607070206000100--
