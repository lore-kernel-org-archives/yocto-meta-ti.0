Return-Path: <kalle@zapdevelopment.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B950DE009A1; Thu, 11 Dec 2014 23:45:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 65 seconds by postgrey-1.32 at yocto-www;
	Thu, 11 Dec 2014 23:45:34 PST
Received: from mailrelay8.public.one.com (mailrelay8.public.one.com
	[91.198.169.216])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AFE0E00993
	for <meta-ti@yoctoproject.org>; Thu, 11 Dec 2014 23:45:34 -0800 (PST)
X-HalOne-Cookie: b8969b3353d4a16bfd25d38820055cbcc4b4a0cc
X-HalOne-ID: 691c04be-81d2-11e4-bf9a-b82a72cffc46
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=zapdevelopment.com; s=20140924;
	h=from:reply-to:subject:date:message-id:to:mime-version:content-type;
	bh=iocLFKfNo3Jv9Qt1kaxhP9Px+4gpUICEGSMgL0o94Hs=;
	b=e395IDmiCAMmdGPraKR2y5jRojU3iQ/fpjolq5OS0n8/Lonso/VoI5gm+jAZ2Nj4v3i2XbjDW9K5B
	X8RDlN3EO4igV7E37/8gMAogtDQ8VA/Wf4QmEpiaWedcvfnHSuulBLYksZnIoB+aRR/SF2Be6llVr8
	ckxWT2C0Ld/tKb3Q=
Received: from webmail7 (unknown [10.246.6.7])
	by smtpfilter4.public.one.com (Halon Mail Gateway) with SMTP
	for <meta-ti@yoctoproject.org>; Fri, 12 Dec 2014 07:42:23 +0000 (GMT)
X-Originating-IP: 10.246.4.248
User-Agent: One.com webmail 9.6.1
MIME-Version: 1.0
Message-ID: <1418370266664.32456.5724@webmail7>
Date: Fri, 12 Dec 2014 07:44:26 GMT
To: <meta-ti@yoctoproject.org>
From: "Kalle Komierowski" <kalle@zapdevelopment.com>
Subject: TI wirelesl WL18xx drivers
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
X-List-Received-Date: Fri, 12 Dec 2014 07:45:37 -0000
Content-Type: multipart/alternative; boundary="----------5722-1418370266664-1"

------------5722-1418370266664-1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm new to this list, and new to Yocto.
I am about use the TI WL18xx wifi together with Beaglebone. I've seen that =
the older WL12xx drivers are present.
I included the
meta-openembedded/meta-oe/recipes-kernel/compat-wireless
layer/recipe but compat-wireless fails when compiling (maybe a question som=
ething for the meta-oe mailing list)

I have two questions:
1. Is there ongoing work to support the WL18xx drivers in a yocto/oe layer?=
 (if yes, when will they be available?)
2. Should this work be done in meta-ti or the meta-oe/compat-wireless?

Thanks for your time.


BR
-Kalle Komierowski


------------5722-1418370266664-1
Content-Type: multipart/related; boundary="----------5722-1418370266664-2"

------------5722-1418370266664-2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

Hi all, <br /><br />I'm new to this list, and new to Yocto.<br />I am about=
 use the TI WL18xx wifi together with Beaglebone. I've seen that the older =
WL12xx drivers are present.<br />I included the <br />meta-openembedded/met=
a-oe/recipes-kernel/compat-wireless<br />layer/recipe but compat-wireless f=
ails when compiling (maybe a question something for the meta-oe mailing lis=
t)<br /><br />I have two questions:<br />1. Is there ongoing work to suppor=
t the WL18xx drivers in a yocto/oe layer? (if yes, when will they be availa=
ble?)<br />2. Should this work be done in meta-ti or the meta-oe/compat-wir=
eless?<br /><br />Thanks for your time.<br /><br /><br />BR<br />-Kalle Kom=
ierowski<br />

------------5722-1418370266664-2--

------------5722-1418370266664-1--
