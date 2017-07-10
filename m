Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3E2DE00C29; Sun,  9 Jul 2017 23:47:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.49 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.49 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 983CBE00C1C
	for <meta-ti@yoctoproject.org>; Sun,  9 Jul 2017 23:47:08 -0700 (PDT)
Received: by mail-pg0-f49.google.com with SMTP id k14so44723508pgr.0
	for <meta-ti@yoctoproject.org>; Sun, 09 Jul 2017 23:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=maZrufXSFw+ie7Vfq+50XsBa6bv5IGkXXAThlSJQLbc=;
	b=TDC/v6RzJRm4Qw/KJOtmVcGa5tKzltn6B9ZPAteGnwPncSZ8F/UAvz1rqy5h58eEW3
	ypsJXvbdN88WckKCHsmqwQ8KZ+ZdSRRR48JHpNtXyGmEFoIzdA/HAj0SocNzDn3GiCcB
	loTdY9SmruToNjvMaxTj9DkzPGFLQ4pNp/ivjOwsx5vl9cRd2kOSo31Lv66rXpcYAxQk
	8lCfoCNiNx4Gk7ADWG1jWyJC8+vM0CnaGoZQlmynhPbENnXPHe3/8e+WJFAxO79rF83k
	JxikQG7w/CC6qiVom2q80ZbwCLeBW8dNPos5QDW7txVe2txkDjBNztkPvqsmMVSWeDG2
	yxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=maZrufXSFw+ie7Vfq+50XsBa6bv5IGkXXAThlSJQLbc=;
	b=m7Xvccwk1ru4/uKSUMM0MMK4Ww0G5aeOnGWNzBFX0aRS6o6Pp3+QQ2kfk0C4jvaB1o
	Dr7LPwzH99MCX03I9QDBALqraHgoZxabQb07Ov+MPBAfltBNwWtSNiAY2NUV2rqZlHk8
	rYgUZdESSqU6xt9vtv9mc6MTFDcHX1JxTJlJ8iW4rnEh0GvxprcSiI7Uhjwr19l4hJ3V
	sHX40D/6/uA9kQ6Sp6Apcv4w2vKx4pZv1IWQ8mMHjl9QhaOuThFpm0GwQpQDxYXFpQjG
	bc0cbaQ/fDNA60AmqI+mrPb1Bx2p41wjWQ/yIj/EMLdclz1EtnU+2kpr2Fp0jDiX8+/r
	9Hdg==
X-Gm-Message-State: AIVw111SS7lPEadXtEJMkxz6Y87heq+aSYGPCK0zG+OiqPH4cWkxGAuE
	mMZNnPflxVcBq7OV
X-Received: by 10.98.62.131 with SMTP id y3mr42647936pfj.49.1499669228323;
	Sun, 09 Jul 2017 23:47:08 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:13e:d2f9:3adc:ff19?
	([2001:8003:804a:b500:13e:d2f9:3adc:ff19])
	by smtp.gmail.com with ESMTPSA id 8sm20398185pfs.23.2017.07.09.23.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Jul 2017 23:47:07 -0700 (PDT)
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <061b44df-abb7-4c16-7891-888f4796e158@gmail.com>
	<CAD4b0_KhhCrp_+A_KffCWTfh2pbaMkrN54haXWCNL3-f2Wy5aQ@mail.gmail.com>
	<01f2c963-0792-0acc-aef0-0e306da52dd1@gmail.com>
	<CAD4b0_+bXGibsEpsB=r5_7rTB8JTCo3iir70KiN4x628zT94tA@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <c2791765-0dbd-ba0b-ad31-085324046bf7@gmail.com>
Date: Mon, 10 Jul 2017 14:47:04 +0800
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
X-List-Received-Date: Mon, 10 Jul 2017 06:47:11 -0000
Content-Type: multipart/alternative;
	boundary="------------F6E6123417026C0FC0BC6C22"
Content-Language: en-US

--------------F6E6123417026C0FC0BC6C22
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Ok, thanks,

I tried with 10 ports powered USB hub with wireless keyboard, it looks 
better but

I don't know yet, looks like it's not stable..

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

--------------F6E6123417026C0FC0BC6C22
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Ok, thanks,<br>
    </p>
    <p>I tried with 10 ports powered USB hub with wireless keyboard, it
      looks better but<br>
    </p>
    I don't know yet, looks like it's not stable..<br>
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

--------------F6E6123417026C0FC0BC6C22--
