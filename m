Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A675E0049D
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 01:48:01 -0700 (PDT)
Received: by vbme21 with SMTP id e21so2083534vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=vBQsoyhkOs7QD/n3Zrj9PPPzhtWGZvThJ/Ek/31lhJU=;
	b=zqsGNioAZ6wvvqev28i1IeQNKp71tPKPc2teqsgfjRKjvlHzV2efJzhN82AbDYHC7W
	i14QmkqSgrHZlRuQ8+j8snS64i0SMlUB4FTimULdjPOH/BaEsZ/bN32iTdpjlIcoxB7J
	RaiyAjqc3iY2i8dqXtG2URf+jlLkz+LIdmPs71wFBo/zCme93Qqcjpgc2hmReRWq+Yfq
	DtSDv7XCIi/paZy7zZ//AuDiBzrKzk1kuT6pkhCKRRH+PIn+Ba9xVKbpgn6VxMY1+VA1
	UIOOGeeEN1MUciD0Hs5MP6L0h7BtoMcVXfUhjPKdVV5neu751wRwIaCcYDy0CX4xOq3R
	0WNg==
MIME-Version: 1.0
Received: by 10.52.69.72 with SMTP id c8mr1572241vdu.37.1348735678656; Thu, 27
	Sep 2012 01:47:58 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Thu, 27 Sep 2012 01:47:58 -0700 (PDT)
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com> <5062FB00.7080307@mlbassoc.com>
	<506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
Date: Thu, 27 Sep 2012 10:47:58 +0200
X-Google-Sender-Auth: WuTe-zh-HuDusWFUNI2r6nhCRyg
Message-ID: <CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
From: Enrico <ebutera@users.sourceforge.net>
To: Christian.Schulenberg@bmw.de
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Thu, 27 Sep 2012 08:48:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 27, 2012 at 9:25 AM,  <Christian.Schulenberg@bmw.de> wrote:
> I used the meta.ivi layer in combination with meta-ti before in a much older version, which worked fine for me, but at the moment I have no idea what's wrong with my configuration.

Maybe it's not a problem with your config but just a kernel bug or a
faulty toolchain+kernel combination.

You can try to manually build a (recent) kernel and see if it boots,
if you need directions just ask.

Enrico

