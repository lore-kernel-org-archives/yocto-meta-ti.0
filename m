Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C91EE00BD5; Thu,  6 Jul 2017 18:14:08 -0700 (PDT)
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
	*      [74.125.83.51 listed in list.dnswl.org]
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E451E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 18:14:04 -0700 (PDT)
Received: by mail-pg0-f51.google.com with SMTP id u62so8987841pgb.3
	for <meta-ti@yoctoproject.org>; Thu, 06 Jul 2017 18:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=0AywX8+PrGoRfIgkmAPymf9Waf6kZfUjSnWbDZ25NOo=;
	b=B9Gtqw/q00kF7G+Nayr7PaoK/3m7xJzwye9Xg0k3qTpm6bwMdh4dHs6q1leFwTej3N
	WAsE0uzGkH8shX7DLMT+7K1piRGZFiRitPfsbeMqyG/uWk7Aa69lF6k4cdKnvxHYT0t1
	qj3Zy1/LQcSdZH21ltq/OiHA4GUk2wrvQZXqLYyO/6R1svG+ct0TxMI6ArgMqd32wblE
	0RqhIRFggJik17Vy0J5HTd1TVjhGsxHgtz1VCyGnjWzYEFREv0Fvs8/GiiVxkRKcShN3
	qV1+lQJVaEjQ2ii03pMBsqtwqF0UKiD8WNpDUBODUrJJtlwJ6YuGv9hxPffqIN2L2rKI
	4TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=0AywX8+PrGoRfIgkmAPymf9Waf6kZfUjSnWbDZ25NOo=;
	b=Lt+DUK2uwUoL8zZU0e+0z/AX8/3+5GPYAGXf40yOCmqWUv98+omn0oAu/04Ndvh8al
	h9xe8v/8J943YJsKzTLvNlC6OPKX9ga+XX1ppEr2No6Gj8gaT0xn5ClQ+ABuX2blJrxq
	xExzG71QTp0flovinzRv6V+2ltu9ZyszM82TrL3kcVXVIYOJDOilS5Bf04Xs6Kg7RNwI
	xYkWRf9bPKTA1bNb1QKglepo2Hr73GI+DHpHKJf/RKYpNKC/Awu5yZmh7f57wswHGTw6
	l8u+9BuaZJ7evDnwvN9qbwAFn50Oek9dXHG7nIR+0uZ/fbVjQW8Q40x4qyWFrkv0fzE7
	0bKQ==
X-Gm-Message-State: AIVw112BOtphd7QaXkK7IkhSwajnh/tpfGB7d4aqAPrsPu6NKWCLOTat
	DVn/9DgG7UVMfsf6
X-Received: by 10.99.163.26 with SMTP id s26mr20172525pge.232.1499390043808;
	Thu, 06 Jul 2017 18:14:03 -0700 (PDT)
Received: from ?IPv6:2001:8003:804a:b500:c5a6:f3a6:fe09:a31a?
	([2001:8003:804a:b500:c5a6:f3a6:fe09:a31a])
	by smtp.gmail.com with ESMTPSA id
	t26sm2968627pfe.88.2017.07.06.18.14.02 for <meta-ti@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 18:14:03 -0700 (PDT)
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
From: Riko Ho <antonius.riko@gmail.com>
Message-ID: <6f7aa3d4-399c-c162-9077-c19cd9a4cfb0@gmail.com>
Date: Fri, 7 Jul 2017 09:14:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
Subject: GPIO on DTS ?
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
X-List-Received-Date: Fri, 07 Jul 2017 01:14:08 -0000
Content-Type: multipart/alternative;
	boundary="------------96BFCCE7A654116FBCAAF7CA"
Content-Language: en-US

--------------96BFCCE7A654116FBCAAF7CA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Meta-TI Team Member,

I want to use 4 GPIO pins of my beaglebone black,

Here's my dts code :

==========

  gpio0_pins: gpio0_pins {
                 pinctrl-single,pins = <
                     AM33XX_IOPAD(0x840, PIN_INPUT_PULLUP | MUX_MODE7) 
/* gpmc_a0.gpio1_16 */
                     AM33XX_IOPAD(0x844, PIN_OUTPUT_PULLDOWN | 
MUX_MODE7) /* gpmc_a1.gpio1_17 */
                     AM33XX_IOPAD(0x878, PIN_OUTPUT_PULLDOWN | 
MUX_MODE7) /* gpmc_be1n.gpio1_28 */
                     AM33XX_IOPAD(0x9A4, PIN_OUTPUT_PULLDOWN | 
MUX_MODE7) /* mcasp0_fsr.gpio3_19 */
                 >;
};

// Added GPIO0 node, experiment by Riko Ho 7 July 2017
&gpio0 {
          status = "okay";
          pinctrl-names = "default";
          pinctrl-0 = <&gpio0_pins>;

};


=======

I can see it already, are they correct ?

root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux# cat 
pinmux-pins | grep "gpio0"
pin 16 (PIN16): 44e07000.gpio (GPIO UNCLAIMED) function gpio0_pins group 
gpio0_pins
pin 17 (PIN17): 44e07000.gpio (GPIO UNCLAIMED) function gpio0_pins group 
gpio0_pins
pin 30 (PIN30): 44e07000.gpio (GPIO UNCLAIMED) function gpio0_pins group 
gpio0_pins
pin 105 (PIN105): 44e07000.gpio (GPIO UNCLAIMED) function gpio0_pins 
group gpio0_pins

==========

I got :

//omap_gpio 44e07000.gpio: could not find pctldev for node 
/ocp/l4_wkup@44c00000/scm@210000/pinmux@800/gpio0_pins, deferring probe,

When the board boots, is it ok ? Or I miss something, please advice, thanks.

-- 
*

/*******/
Sent by Ubuntu LTS 16.04,
Kind regards,
Riko Ho
/*******/

*

--------------96BFCCE7A654116FBCAAF7CA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Meta-TI Team Member,</p>
    <p>I want to use 4 GPIO pins of my beaglebone black,</p>
    <p>Here's my dts code :</p>
    <p>==========<br>
    </p>
    <p> gpio0_pins: gpio0_pins {<br>
                      pinctrl-single,pins = &lt;<br>
                          AM33XX_IOPAD(0x840, PIN_INPUT_PULLUP |
      MUX_MODE7) /* gpmc_a0.gpio1_16 */<br>
                          AM33XX_IOPAD(0x844, PIN_OUTPUT_PULLDOWN |
      MUX_MODE7) /* gpmc_a1.gpio1_17 */<br>
                          AM33XX_IOPAD(0x878, PIN_OUTPUT_PULLDOWN |
      MUX_MODE7) /* gpmc_be1n.gpio1_28 */<br>
                          AM33XX_IOPAD(0x9A4, PIN_OUTPUT_PULLDOWN |
      MUX_MODE7) /* mcasp0_fsr.gpio3_19 */<br>
                      &gt;;<br>
      };  <br>
    </p>
    <p>// Added GPIO0 node, experiment by Riko Ho 7 July 2017<br>
      &amp;gpio0 {<br>
               status = "okay";<br>
               pinctrl-names = "default";<br>
               pinctrl-0 = &lt;&amp;gpio0_pins&gt;;<br>
             <br>
      };<br>
    </p>
    <p><br>
    </p>
    <p>=======<br>
    </p>
    <p>I can see it already, are they correct ?<br>
    </p>
    <p><a class="moz-txt-link-abbreviated" href="mailto:root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux#">root@beaglebone:/sys/kernel/debug/pinctrl/44e10800.pinmux#</a> cat
      pinmux-pins | grep "gpio0"<br>
      pin 16 (PIN16): 44e07000.gpio (GPIO UNCLAIMED) function gpio0_pins
      group gpio0_pins<br>
      pin 17 (PIN17): 44e07000.gpio (GPIO UNCLAIMED) function gpio0_pins
      group gpio0_pins<br>
      pin 30 (PIN30): 44e07000.gpio (GPIO UNCLAIMED) function gpio0_pins
      group gpio0_pins<br>
      pin 105 (PIN105): 44e07000.gpio (GPIO UNCLAIMED) function
      gpio0_pins group gpio0_pins</p>
    <p>==========<br>
    </p>
    <p>I got :</p>
    <p>//omap_gpio 44e07000.gpio: could not find pctldev for node
      /ocp/l4_wkup@44c00000/scm@210000/pinmux@800/gpio0_pins, deferring
      probe,</p>
    <p>When the board boots, is it ok ? Or I miss something, please
      advice, thanks.<br>
    </p>
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

--------------96BFCCE7A654116FBCAAF7CA--
