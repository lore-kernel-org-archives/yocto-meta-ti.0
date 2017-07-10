Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9C3EE00C29; Sun,  9 Jul 2017 23:48:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.180 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.180 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57DBEE00C1C
	for <meta-ti@yoctoproject.org>; Sun,  9 Jul 2017 23:48:16 -0700 (PDT)
Received: by mail-pf0-f180.google.com with SMTP id q86so45047783pfl.3
	for <meta-ti@yoctoproject.org>; Sun, 09 Jul 2017 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=Jon1ftFTDT1Ma3aszTnL9OFEAUYA9ZjBOLqOaa8KaQg=;
	b=FFRMj+SJCjYJa1gvItby/T5/HVI2zz4XGdX+7FCJ39nUwdCdIYCfpJYhc/stC0CDxP
	uV3FR0whWOWoWgJzWAnsWVVpaVg7d56zv/y1yszqo4YMnZQ8J2BpP8kfqmoGNke5zRLf
	nW4J8CCc1LwJ5asxC5RsOVZ1/7Izwi1qmitkewKIFMSD6GpHsuXGnacpW5VZa4tE/thw
	DBw1DoRxad3n7h8WhDULysF4Gs8hKhWkQNckHtsErlwhx3nbBTXv9/ma5rxbmtiGYY/J
	eUlZoRuBb6inCD/o9teNswPHqiyB5yBxbxF/aRVrtvsdH3DwLal2V1Wty08AwDTpPC++
	XDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Jon1ftFTDT1Ma3aszTnL9OFEAUYA9ZjBOLqOaa8KaQg=;
	b=coiCRlCKEUoGURzMFKCoUjXvSRj/kMWBcxJwyO5CtboJgooZhyAlOykhV9HXHXdpru
	oqdan/SDXAwhplRFIrDajc+Ovml12Wh6CWHagRVbqxfIracERkkVcJy+3bshEHHAm2zH
	PUZbtzCKqUS2JlLRCyRduFgS6sBR5DcCw0DN23xduwTV94RJR+NxYTWTXBiDI8zTMjc7
	2a2S6x9s5WzaW5NluoJsTw3LlcOeaUy5qUcllY/dKf1p7X+v0G0Ko0MAI6NBJTlM0a2+
	sqe7FcN1+0DtzSjZkLgQsiTxurG0rQWzfz2WbjqlX9bpXnomsyGooIC+FTLViNDGm8pO
	usLQ==
X-Gm-Message-State: AIVw113J53T5g5VLAWTf7/T9S7/y11OupWXTqD3+QKp+wG+Lfy0MgEKN
	goL6/tlJdlAv1j6C
X-Received: by 10.98.8.93 with SMTP id c90mr2555488pfd.213.1499669296276;
	Sun, 09 Jul 2017 23:48:16 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:13e:d2f9:3adc:ff19?
	([2001:8003:804a:b500:13e:d2f9:3adc:ff19])
	by smtp.gmail.com with ESMTPSA id
	b85sm22562649pfe.94.2017.07.09.23.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Jul 2017 23:48:15 -0700 (PDT)
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <061b44df-abb7-4c16-7891-888f4796e158@gmail.com>
	<CAD4b0_KhhCrp_+A_KffCWTfh2pbaMkrN54haXWCNL3-f2Wy5aQ@mail.gmail.com>
	<01f2c963-0792-0acc-aef0-0e306da52dd1@gmail.com>
	<CAD4b0_+bXGibsEpsB=r5_7rTB8JTCo3iir70KiN4x628zT94tA@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <9aeb6d6d-4382-ca42-bbd2-62a941cd6291@gmail.com>
Date: Mon, 10 Jul 2017 14:48:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAD4b0_+bXGibsEpsB=r5_7rTB8JTCo3iir70KiN4x628zT94tA@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: HDMI and Wifi USB dongle ?
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
X-List-Received-Date: Mon, 10 Jul 2017 06:48:17 -0000
Content-Type: multipart/alternative;
	boundary="------------FE2E4E0C5B99B53E20E7B34C"
Content-Language: en-US

--------------FE2E4E0C5B99B53E20E7B34C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

That's my lsmod :

root@beaglebone:~# lsmod
     Not tainted
usb_f_eem 7202 1 - Live 0xbf0f9000
g_ether 4937 0 - Live 0xbf0f3000
usb_f_rndis 19969 2 g_ether, Live 0xbf0e9000
u_ether 14019 3 usb_f_eem,g_ether,usb_f_rndis, Live 0xbf0e1000
libcomposite 47061 3 usb_f_eem,g_ether,usb_f_rndis, Live 0xbf0ce000
configfs 31854 4 usb_f_eem,usb_f_rndis,libcomposite, Live 0xbf0c1000
rtl8xxxu 94567 0 - Live 0xbf0a2000
omap_rng 5957 0 - Live 0xbf09d000
rng_core 8667 1 omap_rng, Live 0xbf096000
snd_soc_davinci_mcasp 17050 0 - Live 0xbf08d000
snd_soc_omap 4113 1 snd_soc_davinci_mcasp, Live 0xbf088000
snd_soc_edma 1211 1 snd_soc_davinci_mcasp, Live 0xbf084000
snd_soc_hdmi_codec 5576 0 - Live 0xbf07f000
snd_soc_core 157462 4 
snd_soc_davinci_mcasp,snd_soc_omap,snd_soc_edma,snd_soc_hdmi_codec, Live 
0xbf049000
snd_pcm_dmaengine 5065 2 snd_soc_omap,snd_soc_core, Live 0xbf044000
snd_pcm 90717 5 
snd_soc_davinci_mcasp,snd_soc_omap,snd_soc_hdmi_codec,snd_soc_core,snd_pcm_dmaengine, 
Live 0xbf024000
snd_timer 22470 1 snd_pcm, Live 0xbf01a000
snd 57155 3 snd_soc_core,snd_pcm,snd_timer, Live 0xbf004000
soundcore 1350 1 snd, Live 0xbf000000
root@beaglebone:~#


On 10/07/17 14:42, Maciej Borzęcki wrote:
> On Mon, Jul 10, 2017 at 8:27 AM, Riko Ho <antonius.riko@gmail.com> wrote:
>> I tried with ATX power supply, still get the same response, why is that ?
>>
> Suggested order of debugging would be:
>
> - look into dmesg and syslog/journalctl for any suspicious messages
> popping up when you enable HDMI
>
> - check if order of events has any significance (i.e. HDMI on when
> turn wifi on, or wifi on then enable HDMI)
>
> - try a powered USB hub (a passive one may be good enough too)
>
> - try using USB extension cable for the wifi dongle.
>
> The last 2 points are easiest to verify.
>
>> On 10/07/17 14:24, Maciej Borzęcki wrote:
>>
>> On Mon, Jul 10, 2017 at 6:31 AM, Riko Ho <antonius.riko@gmail.com> wrote:
>>
>> Dear Meta-TI Members,
>>
>> How can I fix the current issue between HDMI port and Wifi on USB dongle ?
>>
>> Everytime I put HDMI, my USB dongle is down ??
>>
>> I would start by trying to use a decent power supply.
>>

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------FE2E4E0C5B99B53E20E7B34C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>That's my lsmod :</p>
    <p>root@beaglebone:~# lsmod<br>
          Not tainted<br>
      usb_f_eem 7202 1 - Live 0xbf0f9000<br>
      g_ether 4937 0 - Live 0xbf0f3000<br>
      usb_f_rndis 19969 2 g_ether, Live 0xbf0e9000<br>
      u_ether 14019 3 usb_f_eem,g_ether,usb_f_rndis, Live 0xbf0e1000<br>
      libcomposite 47061 3 usb_f_eem,g_ether,usb_f_rndis, Live
      0xbf0ce000<br>
      configfs 31854 4 usb_f_eem,usb_f_rndis,libcomposite, Live
      0xbf0c1000<br>
      rtl8xxxu 94567 0 - Live 0xbf0a2000<br>
      omap_rng 5957 0 - Live 0xbf09d000<br>
      rng_core 8667 1 omap_rng, Live 0xbf096000<br>
      snd_soc_davinci_mcasp 17050 0 - Live 0xbf08d000<br>
      snd_soc_omap 4113 1 snd_soc_davinci_mcasp, Live 0xbf088000<br>
      snd_soc_edma 1211 1 snd_soc_davinci_mcasp, Live 0xbf084000<br>
      snd_soc_hdmi_codec 5576 0 - Live 0xbf07f000<br>
      snd_soc_core 157462 4
      snd_soc_davinci_mcasp,snd_soc_omap,snd_soc_edma,snd_soc_hdmi_codec,
      Live 0xbf049000<br>
      snd_pcm_dmaengine 5065 2 snd_soc_omap,snd_soc_core, Live
      0xbf044000<br>
      snd_pcm 90717 5
snd_soc_davinci_mcasp,snd_soc_omap,snd_soc_hdmi_codec,snd_soc_core,snd_pcm_dmaengine,
      Live 0xbf024000<br>
      snd_timer 22470 1 snd_pcm, Live 0xbf01a000<br>
      snd 57155 3 snd_soc_core,snd_pcm,snd_timer, Live 0xbf004000<br>
      soundcore 1350 1 snd, Live 0xbf000000<br>
      root@beaglebone:~# <br>
      <br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/07/17 14:42, Maciej Borzęcki
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAD4b0_+bXGibsEpsB=r5_7rTB8JTCo3iir70KiN4x628zT94tA@mail.gmail.com">
      <pre wrap="">On Mon, Jul 10, 2017 at 8:27 AM, Riko Ho <a class="moz-txt-link-rfc2396E" href="mailto:antonius.riko@gmail.com">&lt;antonius.riko@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">I tried with ATX power supply, still get the same response, why is that ?

</pre>
      </blockquote>
      <pre wrap="">
Suggested order of debugging would be:

- look into dmesg and syslog/journalctl for any suspicious messages
popping up when you enable HDMI

- check if order of events has any significance (i.e. HDMI on when
turn wifi on, or wifi on then enable HDMI)

- try a powered USB hub (a passive one may be good enough too)

- try using USB extension cable for the wifi dongle.

The last 2 points are easiest to verify.

</pre>
      <blockquote type="cite">
        <pre wrap="">
On 10/07/17 14:24, Maciej Borzęcki wrote:

On Mon, Jul 10, 2017 at 6:31 AM, Riko Ho <a class="moz-txt-link-rfc2396E" href="mailto:antonius.riko@gmail.com">&lt;antonius.riko@gmail.com&gt;</a> wrote:

Dear Meta-TI Members,

How can I fix the current issue between HDMI port and Wifi on USB dongle ?

Everytime I put HDMI, my USB dongle is down ??

I would start by trying to use a decent power supply.

</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
    <div class="moz-signature">-- <br>
      <b>
        <p style="color:blue;"> /*******/<br>
          Sent by Ubuntu LTS 16.04,<br>
          Kind regards,<br>
          Riko Ho<br>
          /*******/<br>
        </p>
      </b></div>
  </body>
</html>

--------------FE2E4E0C5B99B53E20E7B34C--
