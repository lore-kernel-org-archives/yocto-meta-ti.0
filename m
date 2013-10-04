Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6499E0163D
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 11:46:49 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94Ikl2s030710;
	Fri, 4 Oct 2013 13:46:47 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94IklMD012461;
	Fri, 4 Oct 2013 13:46:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 4 Oct 2013 13:46:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94Ikkuj016892;
	Fri, 4 Oct 2013 13:46:47 -0500
Date: Fri, 4 Oct 2013 14:46:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Pow, Christopher (SWCOE)" <Christopher.Pow@honeywell.com>
Message-ID: <20131004184645.GB3672@edge>
References: <tw8uf8cbqu0w8kxjs3nsu24x.1380911274107@email.android.com>
	<7B8A37CE7777314D9B931CDD3BA8C83B1BA4C507@de08ex3002.global.ds.honeywell.com>
MIME-Version: 1.0
In-Reply-To: <7B8A37CE7777314D9B931CDD3BA8C83B1BA4C507@de08ex3002.global.ds.honeywell.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: User space drivers
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
X-List-Received-Date: Fri, 04 Oct 2013 18:46:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Also, you may find this project interesting:

https://github.com/jackmitch/libsoc

-- 
Denys


On Fri, Oct 04, 2013 at 06:42:22PM +0000, Pow, Christopher (SWCOE) wrote:
> Linux documentation is very clear on how to interact with GPIO from user 
> space application and even use them as interrupts.  Refer to 
> Documentation/gpio.txt, section “Sysfs Interface for Userspace (OPTIONAL)” – 
> also make sure you enable the sysfs portion of gpiolib in menuconfig 
> (CONFIG_GPIO_SYSFS).
> 
> Hi all,
> 
> I am wanting to implement a user space driver complete with interrupt in 
> yocto. I see that there is a sample generic platform driver in the kernel, 
> but not sure how to use it.
> 
> Say i want to talk to GPIO Is it simply a matter of pointing the .dts entry 
> for the driver to the uio driver?
> 
> Any pointers would be very helpful ..

