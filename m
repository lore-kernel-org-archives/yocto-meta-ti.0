Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B253AE00C29; Sun,  9 Jul 2017 23:27:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
	*      [209.85.192.169 listed in list.dnswl.org]
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BDB5E00C1C
	for <meta-ti@yoctoproject.org>; Sun,  9 Jul 2017 23:27:17 -0700 (PDT)
Received: by mail-pf0-f169.google.com with SMTP id q86so44783789pfl.3
	for <meta-ti@yoctoproject.org>; Sun, 09 Jul 2017 23:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=YRf44Ab2GNSdhqe4YGYiWReh/kOTEi3l9/5XqzF0s1g=;
	b=hjk7Fh1mI479l/TJDpPBxY8uCPdXyhi4N/cXO4Rz3LmLUtEytLo+yql2bQYBzWfwmB
	2iICygIZS+5fndMrt7OMjIuNRBb4Z/6H7yq2T7+VK+VbZHwJByeR2Q2/wb3NDFMdp9Yh
	IMRJk03rkc0tEpVg06G8IQD4U2fftCCOdQav8wSjdZTUozVJwtuG5vd+F5HByI/1qpv9
	QdtinUExRJPUnFNSK2hDkjL9z4/b6HrRTD8l0Sy08zSp+OQP0VYWZ/+cT9S0M5jOZnsX
	wx5wHVDjY5P2Ex2Ul9kZZrV0Zhd4usPHXW65UdUfbfa6bKNIqyewmNQVAqIMmhcN9RXJ
	h6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=YRf44Ab2GNSdhqe4YGYiWReh/kOTEi3l9/5XqzF0s1g=;
	b=Fbcu9WPjfUpbb1e+GiDe9oKJICc/KFFdctCCLCy1NUwn/FGGkN9y+J7nFwoziK17Ot
	A3c5AJgA78IGbnea+yzGBrGe2+AQKBI811QDNCkQhzA5qQuyDwtU7K/Mpdw5KeAgYhqI
	3NA8JW0v1Ee5wI02vlIkCASyQ+uIy4Uy+TK46U8drJ4BI4s5XARD9eUm3cGsS3R6q6GI
	SrKMMOpfAoxvhSHOLsjhjrFRyp8Mx/df30pUO23d5GsZz3Zp370ZUWN8t2vJCbyeK6RM
	wdgpMPMy6U/qCU69v/sQIns8qOk/0otsFchs2/7KmfatWcXDiW92NdpehtyOk8y+HQLV
	uXwA==
X-Gm-Message-State: AIVw110+JQiq8+lK+Ny+qKzgQVg6UtP2i9TbHo2hYXrgfC/75KjBw/VI
	GmonW9dBhC/i+0NT
X-Received: by 10.84.232.207 with SMTP id x15mr16529897plm.173.1499668037134; 
	Sun, 09 Jul 2017 23:27:17 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:13e:d2f9:3adc:ff19?
	([2001:8003:804a:b500:13e:d2f9:3adc:ff19])
	by smtp.gmail.com with ESMTPSA id
	j27sm19890381pgn.63.2017.07.09.23.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Jul 2017 23:27:16 -0700 (PDT)
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <061b44df-abb7-4c16-7891-888f4796e158@gmail.com>
	<CAD4b0_KhhCrp_+A_KffCWTfh2pbaMkrN54haXWCNL3-f2Wy5aQ@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <01f2c963-0792-0acc-aef0-0e306da52dd1@gmail.com>
Date: Mon, 10 Jul 2017 14:27:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAD4b0_KhhCrp_+A_KffCWTfh2pbaMkrN54haXWCNL3-f2Wy5aQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Jul 2017 06:27:24 -0000
Content-Type: multipart/alternative;
	boundary="------------06900E00F217A78B1FB748BE"
Content-Language: en-US

--------------06900E00F217A78B1FB748BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I tried with ATX power supply, still get the same response, why is that ?


On 10/07/17 14:24, Maciej Borzęcki wrote:
> On Mon, Jul 10, 2017 at 6:31 AM, Riko Ho <antonius.riko@gmail.com> wrote:
>> Dear Meta-TI Members,
>>
>> How can I fix the current issue between HDMI port and Wifi on USB dongle ?
>>
>> Everytime I put HDMI, my USB dongle is down ??
> I would start by trying to use a decent power supply.
>
>

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------06900E00F217A78B1FB748BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I tried with ATX power supply, still get the same response, why
      is that ?</p>
    <br>
    <div class="moz-cite-prefix">On 10/07/17 14:24, Maciej Borzęcki
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAD4b0_KhhCrp_+A_KffCWTfh2pbaMkrN54haXWCNL3-f2Wy5aQ@mail.gmail.com">
      <pre wrap="">On Mon, Jul 10, 2017 at 6:31 AM, Riko Ho <a class="moz-txt-link-rfc2396E" href="mailto:antonius.riko@gmail.com">&lt;antonius.riko@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Dear Meta-TI Members,

How can I fix the current issue between HDMI port and Wifi on USB dongle ?

Everytime I put HDMI, my USB dongle is down ??
</pre>
      </blockquote>
      <pre wrap="">
I would start by trying to use a decent power supply.


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

--------------06900E00F217A78B1FB748BE--
